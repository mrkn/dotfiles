ver = "4.1.2"
url = "https://github.com/miiton/Cica/releases/download/v#{ver}/Cica_v#{ver}.zip"
sha256 = "4c11e3097fad1146db878a6df0bb4f94ae10177d07fb58db293c657a0f6f8d0f"

directory "/usr/local/share/fonts" do
  owner 'root'
  group 'root'
end

local_ruby_block "Install Cica font" do
  block do
    mktmpdir do |tmpdir|
      filename = File.basename(url)
      unless download_file(url, filename, tmpdir, sha256)
        exit 2
      end
      run_command(["unzip", File.join(tmpdir, filename), "-d", tmpdir])
      run_command(["ls", tmpdir])
      Dir.glob(File.join(tmpdir, "*.ttf")) do |font|
        run_command(["install", "-m", "0644", font, "/usr/local/share/fonts"])
      end
      run_command(["fc-cache", "-f"])
    end
  end
end
