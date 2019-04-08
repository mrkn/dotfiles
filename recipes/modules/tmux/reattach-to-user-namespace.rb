case node[:platform]
when 'darwin'
  package 'reattach-to-user-namespace'
else
  target_fullpath = File.expand_path("~/bin/reattach-to-user-namespace")
  link target_fullpath do
    to File.expand_path('../../../../bin/reattach-to-user-namespace', __FILE__)
    force true
  end

  if node[:user] && node[:group]
    execute "chown -h #{node[:user]}:#{node[:group]} #{target_fullpath}"
  end
end
