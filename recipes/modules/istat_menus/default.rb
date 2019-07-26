istat_menus_version = '5.32'

install_app 'iStat Menus' do
  version istat_menus_version
  url 'http://download.bjango.com/istatmenus/'
  archive_name "istatmenus#{istat_menus_version}.zip"
  sha256 "56eb07e2c581319323cd9784c8a78d5f3a8de11cf3ebae4dcdcd9c6bba12931d"
end
