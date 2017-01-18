rbenv_dir = File.expand_path('~/.rbenv')
rbenv_plugins_dir = File.join(rbenv_dir, 'plugins')
rbenv_versions_dir = File.join(rbenv_dir, 'versions')

git File.join(rbenv_plugins_dir, 'gem-src') do
  repository 'https://github.com/amatsuda/gem-src.git'
end

local_ruby_block 'Install gem-src for all installed Ruby versions' do
  block do
    Dir.glob(File.join(rbenv_versions_dir, '*')) do |version_dir|
      next if File.symlink?(version_dir)  # Skip aliases
      version = File.basename(version_dir)
      run_command("RBENV_VERSION=#{version} rbenv exec gem install gem-src")
    end
  end
end
