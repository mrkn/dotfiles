include_module 'libtool'
include_module 'autoconf'
include_module 'automake'
include_module 'autogen'
include_module 'czmq'

rbenv_dir = File.expand_path('~/.rbenv')
rbenv_versions_dir = File.join(rbenv_dir, 'versions')

local_ruby_block 'Install iruby for all installed Ruby versions' do
  block do
    Dir.glob(File.join(rbenv_versions_dir, '*')) do |version_dir|
      next if File.symlink?(version_dir)  # Skip aliases

      version = File.basename(version_dir)
      run_command("RBENV_VERSION=#{version} rbenv exec gem install cztop iruby")
    end
  end
end
