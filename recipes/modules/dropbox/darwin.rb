dropbox_version = '16.4.30'

install_app 'Dropbox' do
  version dropbox_version
  url 'https://www.dropbox.com/download?plat=mac'
  archive_name 'DropboxInstaller.dmg'
  sha256 '608196eebb0d117ab19d54c866e84af0a8ae2e15ed59d39cf4cdcea759faf877'
  install_by :open
end
