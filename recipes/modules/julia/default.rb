include_recipe '1.5'
include_recipe 'symlink'

execute %Q[chown -h -R #{node[:user]}:#{node[:group]} ~/.jlenv]
execute %Q[chown -h -R #{node[:user]}:#{node[:group]} ~/.julia]
