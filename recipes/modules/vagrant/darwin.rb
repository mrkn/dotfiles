install_app 'Vagrant' do
  version '1.9.2'
  url 'https://releases.hashicorp.com/vagrant/1.9.2/vagrant_1.9.2.dmg'
  sha256 'ee0549a16859042d39c08ae153895da6cdfbad7c587b3438349cdf01efe10703'
  installer_name 'Vagrant.pkg'
  install_by :open
end
