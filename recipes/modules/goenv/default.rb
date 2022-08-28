goenv_dir = File.expand_path("~/.goenv")
plugins_dir = File.join(goenv_dir, 'plugins')

git goenv_dir do
  repository 'https://github.com/syndbg/goenv.git'
end

ENV['PATH'] = "#{goenv_dir}/bin:#{ENV['PATH']}"
