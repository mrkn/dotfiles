docker_version = '18.03.1-ce-mac65'

install_app 'Docker' do
  version docker_version
  url 'https://download.docker.com/mac/stable/Docker.dmg'
  sha256 "a55462f153284ff212f8857945a69d4e128afb6753f5572984877f7b6fc3fc25"
end
