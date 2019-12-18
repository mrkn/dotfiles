ver = "0.4.0"
url = "https://github.com/jwilm/alacritty/releases/download/v#{ver}/Alacritty-v#{ver}-ubuntu_18_04_amd64.deb"
sha256 = "e6d44edc60d22c0e3cd9d1969e1b41a9b9de80d36edadd1b6f818bbc88f95d0e"

local_ruby_block "Install alacritty" do
  block do
    mktmpdir do |tmpdir|
      filename = File.basename(url)
      unless download_file(url, filename, tmpdir, sha256)
        exit 2
      end
      run_command(["dpkg", "-i", File.join(tmpdir, filename)])
    end
  end
end
