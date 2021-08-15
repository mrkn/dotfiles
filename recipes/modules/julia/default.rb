include_recipe '1.5'
include_recipe 'symlink'

execute %Q[chown -h -R #{node[:user]}:#{node[:group]} ~/.jlenv] do
  only_if "test -d ~/.jlenv"
end

execute %Q[chown -h -R #{node[:user]}:#{node[:group]} ~/.julia]
