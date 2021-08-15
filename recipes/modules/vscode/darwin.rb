vscode_version = '1.22.2'

install_app 'Visual Studio Code' do
  version vscode_version
  url 'https://go.microsoft.com/fwlink/?LinkID=620882'
  archive_name 'VSCode-darwin-stable.zip'
  sha256 "acc708669db0d6b6057883283162d5cfae909968fd6970291a96a80c572eedea"
end
