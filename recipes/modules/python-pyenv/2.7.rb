include_module 'pyenv'
include_recipe 'helper'

install_python '2.7.13' do
  keep true
  env PYTHON_CONFIGURE_OPTS: '--enable-shared'
end
