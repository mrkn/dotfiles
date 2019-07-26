dropbox_version = '48.4.58'

install_app 'Dropbox' do
  version dropbox_version
  url 'https://www.dropbox.com/download?plat=mac'
  archive_name 'DropboxInstaller.dmg'
  sha256 "803e83c127f2daf2b865ea03784d10157bc05efba0f92e2b77ccbbcaca8c1d06"
  install_by :open
end
