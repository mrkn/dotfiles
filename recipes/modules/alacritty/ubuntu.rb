ver = "0.3.3"
url = "https://github.com/jwilm/alacritty/releases/download/v#{ver}/Alacritty-v#{ver}-ubuntu_18_04_amd64.deb"
sha256 = "913a19f0fc8a4fe22ea74ee25b583c1cecaadb2033c224307ed27b87ca9b5a83"

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
