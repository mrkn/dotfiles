include_recipe 'helper'

install_python '3.2.6' do
  keep true
  env PYTHON_CONFIGURE_OPTS: '--enable-framework'
end

install_python '3.2.6' do
  prefix '3.2.6-o0'
  keep true
  env PYTHON_CONFIGURE_OPTS: '--enable-framework',
      OPT: '-g -O0 -Wall -Wstrict-prototypes'
end
