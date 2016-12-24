config_dir = File.expand_path("../../../../config", __FILE__)

define :dotfile do
  params[:force] = true unless params.has_key? :force

  link File.join(ENV['HOME'], params[:name]) do
    to File.join(config_dir, params[:name])
    force params[:force]
    owner params[:owner] if params[:owner]
    group params[:group] if params[:group]
  end
end
