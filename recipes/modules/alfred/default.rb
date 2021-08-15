alfred_version = '4.3.2'
bundle_version = 1221

install_app 'Alfred 4' do
  version alfred_version
  url "https://cachefly.alfredapp.com/Alfred_#{alfred_version}_#{bundle_version}.dmg"
  sha256 "5165e00802aff95a52317bd4cc2dee6512341d83de9e6c0ddcbdcff17efe967e"
end
