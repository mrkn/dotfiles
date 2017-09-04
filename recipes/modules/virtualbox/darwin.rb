install_app 'VirtualBox' do
  installer_name 'VirtualBox.pkg'
  install_by :open
  version '5.1.26'
  url 'http://download.virtualbox.org/virtualbox/5.1.26/VirtualBox-5.1.26-117224-OSX.dmg'
  sha256 '51a6cc75841ed60e01ea62974907049fd3d39be7a916f30e77d842c1a8354655'
end
