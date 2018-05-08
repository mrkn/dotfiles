docker_version = '18.03.1-ce-mac65'

install_app 'Docker' do
  version docker_version
  url 'https://download.docker.com/mac/stable/Docker.dmg'
  sha256 '678e2317427377bf6550af4cce7fcea10c4c860b9718fd9db4311350dd886fc2'
end
