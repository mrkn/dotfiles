duet_version = '1.7.1.4'

install_app 'duet' do
  version duet_version
  url 'http://www.duetdisplay.com/mac/'
  archive_name "duet-#{duet_version.gsub('.', '-')}.zip"
  sha256 "518e32bdfe69fee656c1a3fabf14a03f47ce7409ae2875468e9f6e45c28a8fb0"
  install_by :open
end
