skype_version = '7.43'
skype_micro_version = 241
skype_full_version = "#{skype_version}.#{skype_micro_version}"

install_app 'Skype' do
  version skype_version
  url 'https://get.skype.com/go/getskype-macosx'
  archive_name "Skype_#{skype_full_version}.dmg"
  sha256 '08c57f3f870f40f1390f3d8da0953cd4623d6ec8589a4a6852c5d56d903114b7'
end
