alfred_version = '3.8.1'
bundle_version = 961

install_app 'Alfred 3' do
  version alfred_version
  url "https://cachefly.alfredapp.com/Alfred_#{alfred_version}_#{bundle_version}.dmg"
  sha256 '9eb1c72910357775b6684f27b189533645f9d65fce57c7e4dad247042afb6621'
end
