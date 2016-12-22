rbenv_dir = File.expand_path("~/.rbenv")
plugins_dir = File.join(rbenv_dir, 'plugins')

git rbenv_dir do
  repository 'https://github.com/rbenv/rbenv.git'
end

ENV['PATH'] = "#{rbenv_dir}/bin:#{ENV['PATH']}"

git File.join(plugins_dir, 'ruby-build') do
  repository 'https://github.com/rbenv/ruby-build.git'
end

git File.join(plugins_dir, 'rbenv-aliases') do
  repository 'https://github.com/tpope/rbenv-aliases.git'
end

execute 'rbenv alias --auto'
