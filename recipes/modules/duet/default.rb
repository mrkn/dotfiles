duet_version = '1.6.3.4'

install_app 'duet' do
  version duet_version
  url 'http://www.duetdisplay.com/mac/'
  archive_name "duet-#{duet_version.gsub('.', '-')}.zip"
  sha256 'bfd491368cb255d14f69fa055ffb7d0bc2ae9c4fee067384b17ae5601f0bddc2'
  open_after_install true
end
