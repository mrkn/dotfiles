alfred_version = '4.6'
bundle_version = 1266

install_app 'Alfred 4' do
  version alfred_version
  url "https://cachefly.alfredapp.com/Alfred_#{alfred_version}_#{bundle_version}.dmg"
  sha256 "1fbfc0b188f68751fe1b96b060afbbaddf06dda80ed9b5d1dd563f9904211708"
end
