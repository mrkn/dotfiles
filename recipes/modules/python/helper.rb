define :install_python, keep: false, force: nil, debug: false, env: {}, prefix: nil do
  rebuild_flag_name = "REBUILD_PYTHON_#{params[:name].gsub('.', '_').upcase}"
  params[:force] ||= ENV[rebuild_flag_name]

  local_ruby_block "Install python #{params[:prefix] || params[:name]}" do
    block do
      save_envs = {}
      params[:env].each do |key, val|
        save_envs[key.to_s] = ENV[key.to_s]
        ENV[key.to_s] = val
      end

      begin
        if params[:prefix]
          cmdline = [File.expand_path('~/.pyenv/plugins/python-build/bin/python-build')]
        else
          cmdline = ['pyenv', 'install']
          cmdline << (params[:force] ? '-f' : '-s')
        end
        cmdline << '-k' if params[:keep]
        cmdline << '-g' if params[:debug]
        cmdline << params[:name]
        if params[:prefix]
          ENV['PYTHON_BUILD_BUILD_PATH'] = File.expand_path(params[:prefix], '~/.pyenv/sources')
          cmdline << File.expand_path(params[:prefix], '~/.pyenv/versions')
        end
        run_command(cmdline)
      ensure
        save_envs.each do |key, val|
          ENV[key] = val
        end
      end
    end
  end
end
