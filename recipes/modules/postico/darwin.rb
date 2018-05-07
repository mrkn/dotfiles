postico_version = '1.3.5'

install_app 'Postico' do
  version postico_version
  url "https://eggerapps.at/postico/download/"
  archive_name "postico-#{postico_version}.zip"
  sha256 '985a5985f8c88337430f10d4459c87937e07f91c9f3b288964e5e88285f7296e'
end
