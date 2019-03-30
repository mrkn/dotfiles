version = "2.2.0"
url = "https://github.com/monochromegane/the_platinum_searcher/releases/download/v#{version}/pt_linux_amd64.tar.gz"

local_ruby_block "Installing pt" do
  block do
    mktmpdir do |tmpdir|
      filename = File.basename(url)
      download_path = File.join(tmpdir, filename)
      run_command(['curl', '-sfSL', '-o', download_path, url])
      run_command(['tar', 'xf', download_path, '--strip-components=1', '-C', tmpdir])
      run_command(['/usr/bin/install', '-m0755', File.join(tmpdir, 'pt'), '/usr/local/bin'])
    end
  end
end
