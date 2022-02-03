include_module 'nodejs'
execute "npm install -g yarn"
execute "chown -R #{node[:user]}:#{node[:group]} $HOME/.npm"
