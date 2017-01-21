calibre_version = '2.77.0'

install_app 'Calibre' do
  version calibre_version
  url 'https://calibre-ebook.com/dist/osx'
  archive_name "calibre-#{calibre_version}.dmg"
  sha256 '91b90367b73d879665d37528454cc36d8af2fff1f74d73653a4cfa7eb8ff9460'
end
