istat_menus_version = '6.51'

install_app 'iStat Menus' do
  version istat_menus_version
  url 'http://download.bjango.com/istatmenus/'
  archive_name "istatmenus#{istat_menus_version}.zip"
  sha256 "b0daf05bb62c2627136dd5b0cce59caceeafa48e24b5b253ac0d81332d48629d"
end
