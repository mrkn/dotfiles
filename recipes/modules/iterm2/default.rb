iterm2_version = '3.0.13'

install_app 'iTerm' do
  version iterm2_version
  url "https://iterm2.com/downloads/stable/iTerm2-#{iterm2_version.gsub('.', '_')}.zip"
  sha256 'b32cb66bf7fafd22c92adca4ea2d10c23e58d1398627aea5b15f1c396495b574'
end
