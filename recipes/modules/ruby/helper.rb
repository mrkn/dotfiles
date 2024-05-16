define :install_ruby, configure_args: nil, make_jobs: nil, variation_name: nil, keep: false, force: false do
  version = params[:name].to_s
  variation_name = params[:variation_name] || version
  rbenv_root = File.expand_path('~/.rbenv')
  source_dir = File.join(rbenv_root, 'sources', version)
  prefix_dir = File.join(rbenv_root, 'versions', variation_name)

  rebuild_flag_name = "REBUILD_RUBY_#{version.gsub('.', '_').upcase}"
  params[:force] ||= ENV[rebuild_flag_name]
  params[:configure_args] ||= []

  if version == 'master' || version == :master
    version = :master
    git source_dir do
      repository 'https://github.com/ruby/ruby.git'
    end
  else
    directory source_dir

    version_dir = version.split('.')[0, 2].join('.')
    tarball_url = "https://cache.ruby-lang.org/pub/ruby/#{version_dir}/ruby-#{version}.tar.gz"

    if node[:platform] == 'darwin'
      tar = '/usr/bin/tar'
    else
      tar = 'tar'
    end
    execute "curl -fsSL #{tarball_url} | #{tar} xz --strip 1 -C #{source_dir}" do
      not_if "test -f #{source_dir}/configure.in"
    end
  end

  local_ruby_block "Install ruby #{variation_name}" do
    only_if "test ! -x #{prefix_dir}/bin/ruby" unless params[:force]

    block do
      Dir.chdir source_dir do
        if version == :master && params[:force]
          run_command(['git', 'pull', '--rebase', 'origin', 'master'])
        elsif File.file?('Makefile') && params[:force]
          run_command(['make', 'distclean'])
        end

        run_command('./autogen.sh') unless File.file?("configure")

        if params[:configure_args].respond_to?(:call)
          params[:configure_args] = params[:configure_args].call
        end

        configure_cmdline = [
          './configure',
          "--prefix=#{prefix_dir}",
          *params[:configure_args],
        ]
        run_command(configure_cmdline)

        make_cmdline = ['make']
        make_cmdline << '-j' << params[:make_jobs].to_s if params[:make_jobs]
        run_command(make_cmdline)

        run_command(['make', 'install'])
      end
    end
  end

  case node[:platform]
  when 'ubuntu'
    execute "chown -R #{node[:user]}:#{node[:group]} #{source_dir}"
    execute "chown -R #{node[:user]}:#{node[:group]} #{prefix_dir}"
  end

  execute "RBENV_VERSION=#{variation_name} #{rbenv_root}/bin/rbenv exec gem update --system" do
    user node[:user] if node[:user]
  end

  execute "yes | RBENV_VERSION=#{variation_name} #{rbenv_root}/bin/rbenv exec gem update" do
    user node[:user] if node[:user]
  end

  execute "yes | RBENV_VERSION=#{variation_name} #{rbenv_root}/bin/rbenv exec gem install bundler debug || :" do
    user node[:user] if node[:user]
  end
end
