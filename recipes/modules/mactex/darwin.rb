url = "http://tug.org/cgi-bin/mactex-download/MacTeX.pkg"
archive_name = "mactex.pkg"
sha256 = "34e5c48846a674e0025e92bf1ab7bb43a1108f729b4c26c61edcda24fa5383e3"

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
