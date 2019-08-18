julia_version = '1.3.0-rc1'
ver = julia_version.split('.')[0,2].join('.')

case node[:platform]
when 'darwin'
  install_app "Julia-#{ver}" do
    version julia_version
    url "https://julialang-s3.julialang.org/bin/mac/x64/#{ver}/julia-#{julia_version}-mac64.dmg"
    sha256 'f0cab57056e69d1b7c820e369dd730825594f689769a60306ddcabc633cf1c15'
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
  sha256 = 'd56bcba7647277c7864da4fc1bb7811a2aa213e2ab8a13c211711ed4e0729e9d'

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
