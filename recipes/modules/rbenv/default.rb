rbenv_dir = File.expand_path("~/.rbenv")
ruby_build_dir = File.join(rbenv_dir, 'plugins', 'ruby-build')

git rbenv_dir do
  repository 'https://github.com/rbenv/rbenv.git'
end

git ruby_build_dir do
  repository 'https://github.com/rbenv/ruby-build.git'
end
