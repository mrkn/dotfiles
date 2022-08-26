chrome_version = '104.0.5112.101'

install_app 'Google Chrome' do
  version chrome_version
  url 'https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg'
  sha256 '3a03078fd6886ce6b0e72b7bb1b675f7b97bb9257a273bda7c7f1caf734fe00f'
end
