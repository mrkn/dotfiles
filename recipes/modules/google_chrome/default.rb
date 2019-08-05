chrome_version = '2623.112'

install_app 'Google Chrome' do
  version chrome_version
  url 'https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg'
  sha256 '5a4ad06d569ec50edc53c0a864df681bd9f8d9c8b183515e583d7f036908b55a'
end
