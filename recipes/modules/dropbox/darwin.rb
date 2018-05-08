dropbox_version = '48.4.58'

install_app 'Dropbox' do
  version dropbox_version
  url 'https://www.dropbox.com/download?plat=mac'
  archive_name 'DropboxInstaller.dmg'
  sha256 '4278bd0fc5f7f4fca47355f368a501f55261b55b0ac6d5b680cc62bfb60aa2ce'
  install_by :open
end
