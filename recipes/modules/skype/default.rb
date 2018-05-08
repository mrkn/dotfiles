skype_version = '7.59'
skype_micro_version = 37
skype_full_version = "#{skype_version}.#{skype_micro_version}"

install_app 'Skype' do
  version skype_version
  url 'https://get.skype.com/go/getskype-macosx'
  archive_name "Skype_#{skype_full_version}.dmg"
  sha256 '5d5d6811dcb0727c478d198cb24b99317dd10db0e55d81601d77285434f8cf1d'
end
