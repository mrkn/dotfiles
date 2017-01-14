skype_version = '7.43'
skype_micro_version = 241
skype_full_version = "#{skype_version}.#{skype_micro_version}"

install_app 'Skype' do
  version skype_version
  url 'https://get.skype.com/go/getskype-macosx'
  archive_name "Skype_#{skype_full_version}.dmg"
  sha256 '24fe8651e2194b1a75bbb3a91ec9bfb653ad8a762dc8f6c2a2d60d0c7e4394a0'
end
