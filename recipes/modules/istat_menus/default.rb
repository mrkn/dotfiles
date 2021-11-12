istat_menus_version = '6.60'

install_app 'iStat Menus' do
  version istat_menus_version
  url 'http://download.bjango.com/istatmenus/'
  archive_name "istatmenus#{istat_menus_version}.zip"
  sha256 "253deb678827b5be38a072c4470917ee271ef63edbb4427e6c88c9adcfd4dcf9"
end
