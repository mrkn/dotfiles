vscode_version = '1.62.3'

install_app 'Visual Studio Code' do
  version vscode_version
  url "https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal"
  archive_name 'VSCode-darwin-universal-stable.zip'
  sha256 "2d7b93996845a443895d36c42dc3f43e354a079c27187aefc2ec03e3271f9e89"
end
