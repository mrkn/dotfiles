config_dir = File.expand_path("../../../../config", __FILE__)

define :dotfile do
  link File.join(ENV['HOME'], params[:name]) do
    to File.join(config_dir, params[:name])
    owner params[:owner] if params[:owner]
    group params[:group] if params[:group]
  end
end
