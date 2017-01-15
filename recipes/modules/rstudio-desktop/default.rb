rstudio_version = '1.0.136'

case node[:platform]
when 'darwin'
  install_app 'RStudio' do
    version rstudio_version
    url "https://download1.rstudio.org/RStudio-#{rstudio_version}.dmg"
    sha256 '0345818c518bc668e2939e36dcada7572730bdc86cd1b40e1b7d6eee3cb481e2'
  end

  template File.expand_path('~/Library/LaunchAgents/setenv.RSTUDIO_WHICH_R.plist') do
    source File.expand_path('../setenv.RSTUDIO_WHICH_R.plist', __FILE__)
    variables(
      brew_prefix_r: `brew --prefix r`.chomp
    )
  end

  execute 'launchctl unload ~/Library/LaunchAgents/setenv.RSTUDIO_WHICH_R.plist || :' do
    only_if 'test -f ~/Library/LaunchAgents/setenv.RSTUDIO_WHICH_R.plist'
  end

  execute 'launchctl load ~/Library/LaunchAgents/setenv.RSTUDIO_WHICH_R.plist' do
    only_if 'test -f ~/Library/LaunchAgents/setenv.RSTUDIO_WHICH_R.plist'
  end
end
