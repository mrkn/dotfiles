include_recipe 'lib/recipe_helper'

case node[:platform]
when 'ubuntu'
  node[:user]  = 'mrkn'
  node[:group] = 'mrkn'
end

# Set login shell

username = ENV["USER"]
pwent = Etc.getpwnam(username)
unless pwent && pwent.shell.end_with?("/zsh")
  # execute "chsh -s /bin/zsh"
end

include_role File.join(node[:platform], "bootstrap")
