dropbox_version = '17.4.34'

install_app 'Dropbox' do
  version dropbox_version
  url 'https://www.dropbox.com/download?plat=mac'
  archive_name 'DropboxInstaller.dmg'
  sha256 '6bb0742f4cf43f640b3b84ce3e946ac5291eb71635f0f2c384fdeb47483395c1'
  install_by :open
end
