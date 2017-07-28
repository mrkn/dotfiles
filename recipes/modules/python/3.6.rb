install_python '3.6.1' do
  keep true
  env PYTHON_CONFIGURE_OPTS: '--enable-framework'
end

install_python '3.6.1' do
  prefix '3.6.1-o0'
  keep true
  env PYTHON_CONFIGURE_OPTS: '--enable-framework',
      OPT: '-g -gdwarf-5 -O0 -Wall -Wstrict-prototypes'
end

execute 'pyenv global 3.6.1'
