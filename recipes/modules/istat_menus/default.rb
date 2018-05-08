istat_menus_version = '5.32'

install_app 'iStat Menus' do
  version istat_menus_version
  url 'http://download.bjango.com/istatmenus/'
  archive_name "istatmenus#{istat_menus_version}.zip"
  sha256 '2ac78d8498f2264fc00dfa22efdf17b7afe0757cfdb06e45e3acfd3b9ae813b9'
end
