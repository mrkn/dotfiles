julia_version = '1.0.0'
ver = '1.0'

case node[:platform]
when 'darwin'
  install_app "Julia-#{ver}" do
    version julia_version
    url "https://julialang-s3.julialang.org/bin/osx/x64/#{ver}/julia-#{julia_version}-mac64.dmg"
    sha256 '36d435fd8dbe8ea43509fa7f371a88b82977275c542a926bf917bcf640c57509'
  end

  link File.expand_path("~/bin/julia-#{ver}") do
    to "/Applications/Julia-#{ver}.app/Contents/Resources/julia/bin/julia"
    force true
  end

  link File.expand_path("~/bin/julia-#{ver}-debug") do
    to "/Applications/Julia-#{ver}.app/Contents/Resources/julia/bin/julia-debug"
    force true
  end

when 'ubuntu'
  url = "https://julialang-s3.julialang.org/bin/linux/x64/#{ver}/julia-#{julia_version}-linux-x86_64.tar.gz"
  archive_name = File.basename(url)
  sha256 = 'bea4570d7358016d8ed29d2c15787dbefaea3e746c570763e7ad6040f17831f3'

  local_ruby_block "Download and Install Julia #{julia_version}" do
    block do
      downloads_dir = File.expand_path('~/Downloads')
      download_path = File.join(downloads_dir, archive_name)

      unless download_file(url, archive_name, downloads_dir, sha256)
        exit 2
      end

      install_dir = File.expand_path("~/.jlenv/versions/#{julia_version}")
      run_command(['mkdir', '-p', install_dir])
      run_command(['tar', 'xf', download_path, '--strip-components=1', '-C', install_dir])

      home_bin_dir = File.expand_path('~/bin')
      run_command(['mkdir', '-p', home_bin_dir])
      run_command(['ln', '-sf', File.join(install_dir, 'bin/julia'), File.join(home_bin_dir, "julia-#{ver}")])
    end
  end
end

execute %Q[julia-#{ver} #{File.expand_path('../bootstrap.jl', __FILE__)}]
