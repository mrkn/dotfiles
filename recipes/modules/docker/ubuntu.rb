case node[:platform_version]
when '20.04'
  execute 'snap install docker'
else
  package 'docker.io'
end

execute "usermod -aG docker #{node[:user]}" if node[:user]
