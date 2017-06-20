define :install_golang, env: {} do
  rebuild_flag_name = "REBUILD_GOLANG_#{params[:name].gsub('.', '_').upcase}"
  params[:force] ||= ENV[rebuild_flag_name]

  local_ruby_block "Install golang #{params[:name]}" do
    block do
      save_envs = {}
      params[:env].each do |key, val|
        k = key.to_s
        save_envs[k] = ENV[k]
        ENV[k] = val
      end

      begin
        cmdline = ['goenv', 'install']
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
