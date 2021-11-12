vscode_version = '1.22.2'

install_app 'Visual Studio Code' do
  version vscode_version
  url 'https://go.microsoft.com/fwlink/?LinkID=620882'
  archive_name 'VSCode-darwin-stable.zip'
  sha256 "77c4e891d7cf837ac5ceb718237a85dab7501cec8dadf659dce2849d783c0dad"
end
