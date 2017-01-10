rescue_time_version = ''

install_app 'RescueTime' do
  version rescue_time_version
  url 'https://www.rescuetime.com/installers/RescueTimeInstaller.dmg'
  sha256 '76c813e647d88805d596e38590d1ef551dc664920b5690a94709f0767d2b87fe'
end
