config_dir = File.expand_path("../../../../config", __FILE__)

define :dotfile do
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

  link target_fullpath do
    to File.join(config_dir, params[:name])
    force params[:force]
  end

  if params[:owner] && params[:group]
    execute "chown #{params[:owner]}:#{params[:group]} #{target_fullpath}"
  end
end
