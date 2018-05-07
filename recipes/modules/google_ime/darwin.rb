google_ime_version = ''

install_app 'GoogleJapaneseInput' do
  version google_ime_version
  url 'https://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg'
  sha256 'b2e9b7202ed472c5be79fc67c71b98b3faffb25f0499437b7661895e504a60d2'
  installer_name 'GoogleJapaneseInput.pkg'
  install_by :open
end
