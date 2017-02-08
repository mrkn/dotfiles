class << Dir
  def tmpdir
    [ENV['TMPDIR'], ENV['TMP'], ENV['TEMP'], '/tmp', '.'].each do |dir|
      next if !dir
      dir = File.expand_path(dir)
      if (stat = File.stat(dir)) && stat.directory? && stat.writable? &&
          (!stat.world_writable? or stat.sticky?)
        return dir
      end rescue nil
    end
    raise ArgumentError, "could not find a temporary directory"
  end
end

MItamae::RecipeContext.class_eval do
  alias include_recipe_orig include_recipe

  def include_recipe(recipe_path)
    include_recipe_orig(recipe_path)
  rescue
    include_recipe_orig(File.join(recipe_path, node[:platform]))
  end

  def include_module(name)
    include_recipe File.join(top_dir, 'recipes', 'modules', name)
  end

  def include_role(name)
    include_recipe File.join(top_dir, 'recipes', 'roles', name)
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
    source_dir = File.join(rbenv_root, 'sources', 'trunk')
    prefix_dir = File.join(rbenv_root, 'versions', 'trunk')

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

        run_command("RBENV_VERSION=#{version} rbenv exec gem update --system")
        run_command("RBENV_VERSION=#{version} rbenv exec gem update")
        run_command("RBENV_VERSION=#{version} rbenv exec gem install bundler pry pry-byebug")
      end

      only_if "test ! -x #{prefix_dir}/bin/ruby || test x$#{rebuild_flag_name} != x"
    end
  end
  private :build_and_install_ruby

  def pip_package(name)
    execute "pyenv exec pip install '#{name}'"
  end

  def top_dir
    @top_dir ||= File.expand_path('../..', __FILE__)
  end
end

MItamae::ResourceContext.class_eval do
  def mktmpdir(prefix_suffix=nil, *rest)
    path = tmpname_create(prefix_suffix || 'd', *rest) {|n| run_command("mkdir -p '#{n}' && chmod 700 '#{n}'") }
    if block_given?
      begin
        yield path
      ensure
        stat = File.stat(File.dirname(path))
        if stat.world_writable? && !stat.sticky?
          raise ArgumentError, "parent directory is world writable but not sticky"
        end
        run_command(['rm', '-rf', path])
      end
    else
      path
    end
  end

  def make_tmpname(basename, n)
    prefix, suffix = basename
    t = run_command('date +%Y%m%d').stdout.chomp
    path = "#{prefix}#{t}-#{$$}-#{rand(0x100000).to_s(36)}".dup
    path << "-#{n}" if n
    path << suffix if suffix
    path
  end

  def tmpname_create(basename, tmpdir=nil)
    tmpdir ||= Dir.tmpdir
    n = nil
    begin
      path = File.join(tmpdir, make_tmpname(basename, n))
      yield(path, n)
      path
    rescue Errno::EEXIST
      n ||= 0
      n += 1
      retry
    end
  end

  def download_file(url, filename=nil, dest_dir=nil, sha256=nil)
    filename ||= File.basename(url)
    dest_dir = File.expand_path(dest_dir, '~/Downloads')
    download_path = File.join(dest_dir, filename)

    # Check existing file
    if File.file?(download_path) && sha256
      unless run_command("echo '#{sha256}  #{download_path}' | shasum -a 256 -cs -", error: false).success?
        run_command(['rm', '-f', download_path])
      end
    end

    # Download and check file
    unless File.file?(download_path)
      run_command(['curl', '-sfSL', '-o', download_path, url])
      unless File.file?(download_path)
        MItamae.logger.error "download[#{filename}] Failed due to downloading failure."
        return false
      end

      # Check downloaded archive
      if sha256
        unless run_command("echo '#{sha256}  #{download_path}' | shasum -a 256 -cs -", error: false).success?
          MItamae.logger.error "download[#{filename}] Failed due to invalid sha256."
          return false
        end
      end
    end

    true
  end
end

Dir.glob(File.expand_path('../recipe_helpers/*.rb', __FILE__)).each do |helper_file|
  include_recipe helper_file
end
