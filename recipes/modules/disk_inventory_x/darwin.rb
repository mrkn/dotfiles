disk_inventory_x_version = '1.0'

install_app 'Disk Inventory X' do
  version disk_inventory_x_version
  url "http://www.derlien.com/download.php?file=DiskInventoryX"
  archive_name 'DIX1.0Universal.dmg'
  sha256 'f61c070a1ec8f29ee78b8a7c84dd4124553098acc87134e2ef05dbaf2a442636'
end

