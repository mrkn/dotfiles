url = "https://ftp.jaist.ac.jp/pub/CTAN/systems/mac/mactex/MacTeX.pkg"
sha256 = "dc1983c82de2c68f1c434f734d94343959d1338adb6f55132ccce11c787badc1"

local_ruby_block "Download and Install MacTeX.pkg" do
  block do
    archive_name = File.basename(url)
    downloads_dir = File.expand_path('~/Downloads')
    download_path = File.join(downloads_dir, archive_name)

    unless download_file(url, archive_name, downloads_dir, sha256)
      exit 2
    end

    run_command(['open', '-W', download_path])
  end
end
