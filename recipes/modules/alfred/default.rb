alfred_version = '4.0.2'
bundle_version = 1088

install_app 'Alfred 4' do
  version alfred_version
  url "https://cachefly.alfredapp.com/Alfred_#{alfred_version}_#{bundle_version}.dmg"
  sha256 "7f83c73dac84a02308fd84acf3b98824a19fb506db2c97982d080e33f1bf9896"
end
