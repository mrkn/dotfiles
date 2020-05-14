ver = "0.4.0"
url = "https://github.com/jwilm/alacritty/releases/download/v#{ver}/Alacritty-v#{ver}-ubuntu_18_04_amd64.deb"
sha256 = "9118a70245ae5a59348dfed031f9794a86ec825522f5fb7f63d47af57c3538ed"

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
