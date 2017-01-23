docker_version = '1.13.0'

install_app 'Docker' do
  version docker_version
  url 'https://download.docker.com/mac/stable/Docker.dmg'
  sha256 '1ff2a59d36348c2e1df73318e366624b04d42861e81af3d1b72effd803402641'
end
