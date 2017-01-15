rstudio_version = '1.0.136'

case node[:platform]
when 'darwin'
  install_app 'RStudio' do
    version rstudio_version
    url "https://download1.rstudio.org/RStudio-#{rstudio_version}.dmg"
    sha256 '0345818c518bc668e2939e36dcada7572730bdc86cd1b40e1b7d6eee3cb481e2'
  end
end
