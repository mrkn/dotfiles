ver = "0.3.0"
url = "https://github.com/jwilm/alacritty/releases/download/v#{ver}/Alacritty-v#{ver}_amd64.deb"
sha256 = "09239ce8562264d4e755b0d872b707e5fea9c39d0e9c890d13fbf881fb8ecc0c"

local_ruby_block "Install alacritty" do
  block do
    mktmpdir do |tmpdir|
      filename = File.basename(url)
      unless download_file(url, filename, tmpdir, sha256)
        exit 2
      end
      run_command("deb", "install", File.join(tmpdir, filename))
    end
  end
end
