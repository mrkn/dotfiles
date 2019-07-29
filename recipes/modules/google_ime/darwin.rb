google_ime_version = ''

install_app 'GoogleJapaneseInput' do
  version google_ime_version
  url 'https://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg'
  sha256 'db9547c1c629c2c9c0994a0fb3fa4f5f6bf89a009dfa2ce6d8e5c52824b9bf33'
  installer_name 'GoogleJapaneseInput.pkg'
  install_by :open
end
