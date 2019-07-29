postico_version = '1.3.5'

install_app 'Postico' do
  version postico_version
  url "https://eggerapps.at/postico/download/"
  archive_name "postico-#{postico_version}.zip"
  sha256 '638c4312d32f27aa6d92fd737fb55e23916b2b4326a24dc4ca6f9204ab501f1d'
end
