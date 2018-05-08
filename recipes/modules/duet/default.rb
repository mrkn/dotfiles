duet_version = '1.7.1.4'

install_app 'duet' do
  version duet_version
  url 'http://www.duetdisplay.com/mac/'
  archive_name "duet-#{duet_version.gsub('.', '-')}.zip"
  sha256 '77279033e3776af86eb7d54d1177a75edefed72d4c829eea53dc87bf92dd0004'
  install_by :open
end
