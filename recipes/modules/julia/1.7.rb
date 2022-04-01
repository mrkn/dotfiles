julia_version = '1.7.2'
ver = julia_version.split('.')[0,2].join('.')

base_uri = "https://julialang-s3.julialang.org/bin"
variations = {
  "darwin" => {
    "x86_64" => {
      path: "mac/x64/#{ver}/julia-#{julia_version}-mac64.dmg",
      sha256: "ae9d2970ed8987b9c48f166b15f02dbdae017f48e106522540add9030f106f0e"
    },
    "arm64" => {
      path: "mac/aarch64/#{ver}/julia-#{julia_version}-macaarch64.dmg",
      sha256: "420d8e3839c3e39407f5365ceb3bfb84899a440915ec896390568015b3ffa4b9"
    }
  },

  "ubuntu" => {
    "x86_64" => {
      path: "linux/x64/#{ver}/julia-#{julia_version}-linux-x86_64.tar.gz",
      sha256: "a75244724f3b2de0e7249c861fbf64078257c16fb4203be78f1cf4dd5973ba95"
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
  sha256 = variations[os][arch][:path]

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
