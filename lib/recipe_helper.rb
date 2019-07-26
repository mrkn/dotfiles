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
  rescue => err
    begin
      include_recipe_orig(File.join(recipe_path, node[:platform]))
    rescue
      puts *err.backtrace
      raise err
    end
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

  def pip_package(name, opts={})
    pyenv = opts[:pyenv] ? "pyenv exec " : nil
    execute "#{pyenv}pip install '#{name}'"
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
