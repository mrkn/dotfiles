include_module 'xcode/command_line_tools'

brew_prefix = File.expand_path('/opt/brew')
brew_url = 'https://github.com/Homebrew/homebrew/tarball/master'

# Getting user and group names
user_name = `id -un`.chomp
group_name = `id -gn`.chomp

execute "mkdir -p #{brew_prefix}" do
  command "sudo sh -c 'mkdir -p #{brew_prefix}; chown #{user_name}:#{group_name} #{brew_prefix}'"
  not_if %[test -d #{brew_prefix} -a -w #{brew_prefix}]
end

execute "Download and extract homebrew into #{brew_prefix}" do
  command "curl -L #{brew_url} | tar xz --strip 1 -C #{brew_prefix}"
  not_if %[test -x #{brew_prefix}/bin/brew]
end

ENV['PATH'] = "#{brew_prefix}/bin:#{ENV['PATH']}"
