url = "http://tug.org/cgi-bin/mactex-download/MacTeX.pkg"
archive_name = "mactex.pkg"
sha256 = "ce6fa6d3ec5a4058d5889cfc36bf634fd8a5aefb6601d10c853e5f5d76455f4a"

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
