install_app 'VirtualBox' do
  installer_name 'VirtualBox.pkg'
  install_by :open
  version '6.1.2'
  url 'https://download.virtualbox.org/virtualbox/6.1.2/VirtualBox-6.1.2-135662-OSX.dmg'
  sha256 '20fb52bbd7edec58c9eef69046240a809091727872b8b4b254db272ffd6950b4'
end
