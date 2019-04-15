ver = "0.3.5"
url = "https://github.com/rbspy/rbspy/releases/download/v#{ver}/rbspy-v#{ver}-x86_64-unknown-linux-musl.tar.gz"
sha256 = "05c0799da66ef6a3e06d2f88a1c25680a01d9c58125cbdddf25ba07848c4aa3d"

directory "/usr/local/bin"

local_ruby_block "Install rbspy" do
  block do
    mktmpdir do |tmpdir|
      filename = File.basename(url)
      unless download_file(url, filename, tmpdir, sha256)
        exit 2
      end
      run_command(["tar", "xf", File.join(tmpdir, filename)])
      run_command(["install", "-m", "0755", "rbspy", "/usr/local/bin"])
    end
  end
end
