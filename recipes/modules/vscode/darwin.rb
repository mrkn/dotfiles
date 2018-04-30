vscode_version = '1.22.2'

install_app 'Visual Studio Code' do
  version vscode_version
  url 'https://go.microsoft.com/fwlink/?LinkID=620882'
  archive_name 'VSCode-darwin-stable.zip'
  sha256 '92e51c4be9e945a295d719ed2e5e570daf98a4fd1c7be3192ca4f6ffe28f7020'
end
