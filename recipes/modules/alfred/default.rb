alfred_version = '3.2.1'
bundle_version = 768

install_app 'Alfred 3' do
  version alfred_version
  url "https://cachefly.alfredapp.com/Alfred_#{alfred_version}_#{bundle_version}.dmg"
  sha256 '88c7d139e043c15a1c4ee70c18ec8b482f4bc951d798f7026dc0e39802107841'
end
