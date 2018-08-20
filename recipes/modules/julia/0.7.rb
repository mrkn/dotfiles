julia_version = '0.7.0'
ver = '0.7'

case node[:platform]
when 'darwin'
  install_app "Julia-#{ver}" do
    version julia_version
    url "https://julialang-s3.julialang.org/bin/mac/x64/#{ver}/julia-#{julia_version}-mac64.dmg"
    sha256 '6fc151103a77e9d0a00237fd820ce788ce7c156cc096a2220bfbb11ab23ec230'
  end

  link File.expand_path("~/bin/julia-#{ver}") do
    to "/Applications/Julia-#{ver}.app/Contents/Resources/julia/bin/julia"
    force true
  end

  link File.expand_path("~/bin/julia-#{ver}-debug") do
    to "/Applications/Julia-#{ver}.app/Contents/Resources/julia/bin/julia-debug"
    force true
  end
end

execute %Q[julia-#{ver} #{File.expand_path('../bootstrap.jl', __FILE__)}]
