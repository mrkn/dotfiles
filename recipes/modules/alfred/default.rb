alfred_version = '3.6.1'
bundle_version = 910

install_app 'Alfred 3' do
  version alfred_version
  url "https://cachefly.alfredapp.com/Alfred_#{alfred_version}_#{bundle_version}.dmg"
  sha256 'fdefdb35047e193e1d06f5a441f4aabd4b45b24fd43c63d223d8508ad11a131e'
end
