julia_version = '1.5.3'
ver = julia_version.split('.')[0,2].join('.')

case node[:platform]
when 'darwin'
  install_app "Julia-#{ver}" do
    version julia_version
    url "https://julialang-s3.julialang.org/bin/mac/x64/#{ver}/julia-#{julia_version}-mac64.dmg"
    sha256 '802cdb67748bbd8a943604981d4f2a2c4c98899f5bbad0aef8a7ea8bc9b31abd'
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
  sha256 = 'f190c938dd6fed97021953240523c9db448ec0a6760b574afd4e9924ab5615f1'

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
    end
  end

  link File.expand_path("~/bin/julia-#{ver}") do
    to File.expand_path("~/.jlenv/versions/#{julia_version}/bin/julia")
    force true
  end

  link File.expand_path("~/bin/julia-#{ver}-debug") do
    to File.expand_path("~/.jlenv/versions/#{julia_version}/bin/julia-debug")
    force true
  end
end

execute %Q[~/bin/julia-#{ver} #{File.expand_path('../bootstrap.jl', __FILE__)}]
