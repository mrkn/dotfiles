define :install_python, keep: false, force: nil, env: {} do
  rebuild_flag_name = "REBUILD_PYTHON_#{params[:name].gsub('.', '_').upcase}"
  params[:force] ||= ENV[rebuild_flag_name]

  local_ruby_block "Install python #{params[:name]}" do
    block do
      save_envs = {}
      params[:env].each do |key, val|
        save_envs[key.to_s] = ENV[key.to_s]
        ENV[key.to_s] = val
      end

      begin
        cmdline = ['pyenv', 'install']
        cmdline << '-k' if params[:keep]
        cmdline << (params[:force] ? '-f' : '-s')
        cmdline << params[:name]
        run_command(cmdline)
      ensure
        save_envs.each do |key, val|
          ENV[key] = val
        end
      end
    end
  end
end
