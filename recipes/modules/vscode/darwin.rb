vscode_version = '1.22.2'

install_app 'Visual Studio Code' do
  version vscode_version
  url 'https://go.microsoft.com/fwlink/?LinkID=620882'
  archive_name 'VSCode-darwin-stable.zip'
  sha256 "1726d0c2713753186d7b4b664c77aef6fc0dce6356d0c07062dac2533284314f"
end
