istat_menus_version = '5.31'

install_app 'iStat Menus' do
  version istat_menus_version
  url 'http://download.bjango.com/istatmenus/'
  archive_name "istatmenus#{istat_menus_version}.zip"
  sha256 '03089f2760b0290f200f96649cab674c163e18023e4f4ec5ca0af8258c26b2c6'
end
