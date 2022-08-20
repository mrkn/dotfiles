julia_version = '1.8.0'
ver = julia_version.split('.')[0,2].join('.')

base_uri = "https://julialang-s3.julialang.org/bin"
variations = {
  "darwin" => {
    "x86_64" => {
      path: "mac/x64/#{ver}/julia-#{julia_version}-mac64.dmg",
      sha256: "29880bb57614c9c597edf5384a351b3f0299fa097b9eb62cd640c93cde58677b"
    },
    "arm64" => {
      path: "mac/aarch64/#{ver}/julia-#{julia_version}-macaarch64.dmg",
      sha256: "8e113a42fe4eac7b75023136674452f6f09590717755417cd137258707e96540"
    }
  },

  "ubuntu" => {
    "x86_64" => {
      path: "linux/x64/#{ver}/julia-#{julia_version}-linux-x86_64.tar.gz",
      sha256: "e80d732ccb7f79e000d798cb8b656dc3641ab59516d6e4e52e16765017892a00"
    }
  }
}

os = node[:platform]
hi = node.instance_variable_get(:@backend).host_inventory
arch = hi.backend.os_info[:arch]  # TODO: node[:kernel][:machine]

case os
when "darwin"
  install_app "Julia-#{ver}" do
    version julia_version
    url File.join(base_uri, variations[os][arch][:path])
    sha256 variations[os][arch][:sha256]
  end

  link File.expand_path("~/bin/julia-#{ver}") do
    to "/Applications/Julia-#{ver}.app/Contents/Resources/julia/bin/julia"
    force true
  end

  link File.expand_path("~/bin/julia-#{ver}-debug") do
    to "/Applications/Julia-#{ver}.app/Contents/Resources/julia/bin/julia-debug"
    force true
  end


when "ubuntu"
  url = File.join(base_uri, variations[os][arch][:path])
  archive_name = File.basename(url)
  sha256 = variations[os][arch][:sha256]

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

