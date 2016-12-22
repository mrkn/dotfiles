MItamae::RecipeContext.class_eval do
  def include_module(name)
    include_recipe File.join(top_dir, 'recipes', 'modules', name, 'default')
  end

  def include_role(name)
    include_recipe File.join(top_dir, 'recipes', 'roles', name, 'default')
  end

  def brew(*args)
    execute "brew #{args.join(' ')}" do
      command "brew #{args.join(' ')}"
    end
  end

  def mas_package(app_id, app_name=nil)
    local_ruby_block "Install or upgrade the application of #{app_name || app_id}" do
      block do
        if system("mas list | grep -q #{app_id} >&/dev/null")
          # installed
          if system("mas outdated | grep -q #{app_id} >&/dev/null")
            # need to upgrade
            system("mas upgrade #{app_id}")
          end
        else
          # not installed
          system("mas install #{app_id}")
        end
      end
    end
  end

  def install_ruby(version, opts={})
    rbenv_root = File.expand_path("~/.rbenv")
    source_dir = File.join(rbenv_root, 'sources', version)
    prefix_dir = File.join(rbenv_root, 'versions', version)

    configure_args = opts[:configure_args]
    make_jobs = opts[:make_jobs]

    directory source_dir

    version_dir = version.split('.')[0, 2].join('.')
    tarball_url = "https://cache.ruby-lang.org/pub/ruby/#{version_dir}/ruby-#{version}.tar.gz"

    execute "curl -fsSL #{tarball_url} | /usr/bin/tar xz --strip 1 -C #{source_dir}" do
      not_if "test -f #{source_dir}/configure.in"
    end

    build_and_install_ruby(version, source_dir, prefix_dir, configure_args, make_jobs)
  end

  def install_ruby_trunk(opts={})
    rbenv_root = File.expand_path("~/.rbenv")
    source_dir = File.join(rbenv_root, 'sources', 'ruby-trunk')
    prefix_dir = File.join(rbenv_root, 'versions', 'ruby-trunk')

    configure_args = opts[:configure_args] || []
    make_jobs = opts[:make_jobs]

    git source_dir do
      repository 'https://github.com/ruby/ruby.git'
    end

    build_and_install_ruby('trunk', source_dir, prefix_dir, configure_args, make_jobs)
  end

  def build_and_install_ruby(version, source_dir, prefix_dir, configure_args, make_jobs)
    rebuild_flag_name = "REBUILD_RUBY_#{version.gsub('.', '_').upcase}"

    local_ruby_block "Build and install ruby-#{version}" do
      block do
        Dir.chdir source_dir do
          if File.file?('Makefile') && ENV[rebuild_flag_name]
            run_command(['make', 'distclean'])
          end

          run_command('autoconf')

          configure_cmdline = [
            './configure',
            "--prefix=#{prefix_dir}",
            *configure_args
          ]
          run_command(configure_cmdline)

          make_cmdline = ['make']
          make_cmdline << '-j' << make_jobs.to_s if make_jobs
          run_command(make_cmdline)

          run_command(['make', 'install'])
        end
      end

      only_if "test ! -x #{prefix_dir}/bin/ruby || test x$#{rebuild_flag_name} != x"
    end
  end
  private :build_and_install_ruby

  def top_dir
    @top_dir ||= File.expand_path('../..', __FILE__)
  end
end
