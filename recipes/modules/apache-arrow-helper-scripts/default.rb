bin_dir = File.expand_path("../../../../bin", __FILE__)
dest_dir = File.expand_path("~/bin")

scripts = [
  'build-arrow-cpp',
  'build-arrow-glib',
  'run-arrow-dev',
]

directory dest_dir do
  if node[:user] && node[:group]
    owner node[:user]
    group node[:group]
  end
end

scripts.each do |script|
  target = File.join(dest_dir, script)
  link target do
    to File.join(bin_dir, script)
  end

  if node[:user] && node[:group]
    execute "chown -h #{node[:user]}:#{node[:group]} #{target}"
  end
end
