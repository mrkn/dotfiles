package 'tmux'

if node[:platform] == 'darwin'
  package 'reattach-to-user-namespace'
end
