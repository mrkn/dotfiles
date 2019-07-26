skype_version = '7.59'
skype_micro_version = 37
skype_full_version = "#{skype_version}.#{skype_micro_version}"

install_app 'Skype' do
  version skype_version
  url 'https://get.skype.com/go/getskype-macosx'
  archive_name "Skype_#{skype_full_version}.dmg"
  sha256 "84326de68ba388c634ff011356327e91753f9bd791acb335f6abbdf3afc747a6"
end
