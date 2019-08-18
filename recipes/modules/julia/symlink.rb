latest_ver = '1.2'

case node[:platform]
when 'darwin'
  link File.expand_path("~/bin/julia") do
    to "julia-#{latest_ver}"
    force true
  end

  link File.expand_path("~/bin/julia-debug") do
    to "julia-#{latest_ver}-debug"
    force true
  end
end

