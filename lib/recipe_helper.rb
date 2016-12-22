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

  def install_ruby_trunk(opts={})
    rbenv_root = File.expand_path("~/.rbenv")
    source_dir = File.join(rbenv_root, 'sources', 'ruby-trunk')
    prefix_dir = File.join(rbenv_root, 'versions', 'ruby-trunk')

    configure_args = opts[:configure_args] || []
    make_jobs = opts[:make_jobs]

    git source_dir do
      repository 'https://github.com/ruby/ruby.git'
    end

    local_ruby_block 'Build and install ruby-trunk' do
      block do
        Dir.chdir source_dir do
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

      only_if "test ! -x #{prefix_dir}/bin/ruby || test x$REBUILD_RUBY_TRUNK != x"
    end
  end

  def top_dir
    @top_dir ||= File.expand_path('../..', __FILE__)
  end
end
