julia_version = '0.6.0'
ver = '0.6'

case node[:platform]
when 'darwin'
  install_app "Julia-#{ver}" do
    version julia_version
    url "https://julialang-s3.julialang.org/bin/osx/x64/#{ver}/julia-#{julia_version}-osx10.7+.dmg"
    sha256 '0ad3eb9e52a1c38850d04c833fd2375f588fdc4c48804e976ec7bc9c563bf717'
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

execute %Q[julia -e 'Pkg.add("PyCall")']
