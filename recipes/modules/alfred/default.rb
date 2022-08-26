alfred_version = '5.0.1'
bundle_version = 2067

install_app 'Alfred 5' do
  version alfred_version
  url "https://cachefly.alfredapp.com/Alfred_#{alfred_version}_#{bundle_version}.dmg"
  sha256 "1fbfc0b188f68751fe1b96b060afbbaddf06dda80ed9b5d1dd563f9904211708"
end
