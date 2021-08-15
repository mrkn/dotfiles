dropbox_version = '48.4.58'

install_app 'Dropbox' do
  version dropbox_version
  url 'https://www.dropbox.com/download?plat=mac'
  archive_name 'DropboxInstaller.dmg'
  sha256 "06fa5ca25563e620f3831ac7e0ccd2564a234c878165a6c49e8bacf61b38477f"
  install_by :open
end
