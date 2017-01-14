duet_version = '1.6.3.4'

install_app 'duet' do
  version duet_version
  url 'http://www.duetdisplay.com/mac/'
  archive_name "duet-#{duet_version.gsub('.', '-')}.zip"
  sha256 'e8beb6d3c1bee14410d6602d9d6a263a33a76a1c6c5476734070a745e375d96e'
  open_after_install true
end
