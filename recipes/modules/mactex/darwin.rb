url = "http://tug.org/cgi-bin/mactex-download/MacTeX.pkg"
archive_name = "mactex.pkg"
sha256 = "0caf76027c9e0534a0b636f2b880ace4a0463105a7ad5774ccacede761be8c2d"

local_ruby_block "Download and Install MacTeX.pkg" do
  block do
    downloads_dir = File.expand_path('~/Downloads')
    download_path = File.join(downloads_dir, archive_name)

    unless download_file(url, archive_name, downloads_dir, sha256)
      exit 2
    end

    run_command(['open', download_path])
  end
end
