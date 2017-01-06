julia_version = '0.5.0'
ver = '0.5'

case node[:platform]
when 'darwin'
  install_app "Julia-#{ver}" do
    version julia_version
    url "https://s3.amazonaws.com/julialang/bin/osx/x64/#{ver}/julia-#{julia_version}-osx10.7+.dmg"
    sha256 '871dd1f309d0b8659980ef0db667a36cf84e5d0febb2d53b70859de3801bdf03'
  end

  link File.expand_path('~/bin/julia') do
    to "/Applications/Julia-#{ver}.app/Contents/Resources/julia/bin/julia"
    force true
  end

  link File.expand_path('~/bin/julia-debug') do
    to "/Applications/Julia-#{ver}.app/Contents/Resources/julia/bin/julia-debug"
    force true
  end
end

execute %Q[julia -e 'Pkg.add("PyCall")']
