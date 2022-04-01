latest_ver = '1.7'

link File.expand_path("~/bin/julia") do
  to "julia-#{latest_ver}"
  force true
  user node[:user] if node[:user]
  user node[:group] if node[:group]
end

link File.expand_path("~/bin/julia-debug") do
  to "julia-#{latest_ver}-debug"
  force true
  user node[:user] if node[:user]
  user node[:group] if node[:group]
end
