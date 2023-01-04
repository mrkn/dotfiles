julia_version = '1.8.4'
ver = julia_version.split('.')[0,2].join('.')

base_uri = "https://julialang-s3.julialang.org/bin"
variations = {
  "darwin" => {
    "x86_64" => {
      path: "mac/x64/#{ver}/julia-#{julia_version}-mac64.dmg",
      sha256: "17f3f7755361942e76a26801d9e8cddf7020de864780aadf8c85e0bd28631946"
    },
    "arm64" => {
      path: "mac/aarch64/#{ver}/julia-#{julia_version}-macaarch64.dmg",
      sha256: "b1feb9a18be86c7f77de3a84ee396d691b4c54b280842b90b5daa3986ab04d5b"
    }
  },

  "ubuntu" => {
    "x86_64" => {
      path: "linux/x64/#{ver}/julia-#{julia_version}-linux-x86_64.tar.gz",
      sha256: "f0427a4d7910c47dc7c31f65ba7ecaafedbbc0eceb39c320a37fa33598004fd5"
    },
    "arm64" => {
      path: "linux/x64/#{ver}/julia-#{julia_version}-linux-aarch64.tar.gz",
      sha256: "dc4798c1ce8768fa35972e8b149ca3a85fc69e1074b609a72b2cfed5c4aa7050"
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
