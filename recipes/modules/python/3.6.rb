install_python '3.6.0' do
  keep true
  env PYTHON_CONFIGURE_OPTS: '--enable-shared'
end

execute 'pyenv global 3.6.0'
