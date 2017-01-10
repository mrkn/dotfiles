chrome_version = '2623.112'

install_app 'Google Chrome' do
  version chrome_version
  url 'https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg'
  sha256 '144acfbf16e94a6b2d2653b9bf2fafd1059e1f49e4b4ec8c47097451dc80c6f9'
end
