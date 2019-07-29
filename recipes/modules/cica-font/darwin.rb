ver = "5.0.1"
url = "https://github.com/miiton/Cica/releases/download/v#{ver}/Cica_v#{ver}_with_emoji.zip"
sha256 = "b61ae55fb1a4a98dd78e90fe68649bcfaabb20a5eaaffa57c246356890c6b0df"

local_ruby_block "Install Cica font" do
  block do
    mktmpdir do |tmpdir|
      filename = File.basename(url)
      unless download_file(url, filename, tmpdir, sha256)
        exit 2
      end
      run_command(["unzip", File.join(tmpdir, filename), "-d", tmpdir])
      Dir.glob(File.join(tmpdir, "*.ttf")) do |font|
        run_command(["sudo", "install", "-m", "0644", font, "/Library/Fonts/"])
      end
    end
  end
end
