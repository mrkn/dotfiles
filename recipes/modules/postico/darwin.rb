postico_version = '1.2.2'

install_app 'Postico' do
  version postico_version
  url "https://eggerapps.at/postico/download/"
  archive_name "postico-#{postico_version}.zip"
  sha256 '6bae5e169ddf91af762be0ace4e8a9695c0b52ca5285c1cb330e287d29234404'
end
