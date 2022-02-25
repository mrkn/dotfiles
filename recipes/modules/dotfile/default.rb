config_dir = File.expand_path("../../../../config", __FILE__)

define :dotfile, source: nil do
  params[:force] = true unless params.has_key? :force

  case node[:platform]
  when 'ubuntu'
    params[:owner] ||= node[:user]
    params[:group] ||= node[:group]
  end

  target_fullpath = File.join(ENV['HOME'], params[:name])

  directory File.dirname(target_fullpath) do
    owner params[:owner] if params[:owner]
    group params[:group] if params[:group]
  end

  source_name = params[:source] || paramns[:name]
  source_path = File.join(config_dir, source_name)
  if !File.file?(source_path) && File.file?("#{source_path}.erb")
    execute "rm -f #{target_fullpath}"

    template target_fullpath do
      source "#{source_path}.erb"
    end
  else
    link target_fullpath do
      to source_path
      force params[:force]
    end
  end

  if params[:owner] && params[:group]
    execute "chown -h #{params[:owner]}:#{params[:group]} #{target_fullpath}"
  end
end
