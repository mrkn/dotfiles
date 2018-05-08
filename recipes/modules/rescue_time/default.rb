rescue_time_version = '2.11.0.2538'

install_app 'RescueTime' do
  version rescue_time_version
  url 'https://www.rescuetime.com/installers/RescueTimeInstaller.dmg'
  sha256 '3cdfa6b7a54091b00c37881a78d0f77e05d62785b52ccb2e021b677b894d66e9'
end
