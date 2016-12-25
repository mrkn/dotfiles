pyenv_dir = File.expand_path("~/.pyenv")
plugins_dir = File.join(pyenv_dir, 'plugins')

git pyenv_dir do
  repository 'https://github.com/yyuu/pyenv.git'
end

ENV['PATH'] = "#{pyenv_dir}/bin:#{ENV['PATH']}"

git File.join(plugins_dir, 'pyenv-virtualenv') do
  repository 'https://github.com/yyuu/pyenv-virtualenv.git'
end
