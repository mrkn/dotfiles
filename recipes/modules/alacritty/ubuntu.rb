ver = "0.3.2"
url = "https://github.com/jwilm/alacritty/releases/download/v#{ver}/Alacritty-v#{ver}-ubuntu_18_04_amd64.deb"
sha256 = "884dadc9f97792f6a8ef6a062b116f69e25943ab2cab79072cdcc795d6615205"

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
