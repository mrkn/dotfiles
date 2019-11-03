include_module 'python'  # for python@2

url = "https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz"

local_ruby_block "Install google-cloud-sdk" do
  block do
    downloads_dir = File.expand_path("~/Downloads")
    archive_name = File.basename(url)
    download_path = File.join(downloads_dir, archive_name)

    # Download archive
    unless download_file(url, archive_name, downloads_dir, nil)
      MItamae.logger.error "Unable to download #{url}"
      exit 2
    end


    # Extract archive file
    mktmpdir do |tmpdir|
      unless run_command(["tar", "xf", download_path, "-C", tmpdir])
        MItamae.logger.error "Unable to extract #{download_path}"
        exit 2
      end

      result = run_command(["#{tmpdir}/google-cloud-sdk/install.sh",
                            "--usage-reporting", "false",
                            "--bash-completion", "false",
                            "--path-update", "false",
                            "--rc-path", "false",
                            "--quiet"])
      unless result.success?
        MItamae.logger.error "Unable to install google-cloud-sdk"
        MItamae.logger.error result.stderr
        exit 2
      end

      home_bin_dir = File.expand_path("~/bin")
      result = run_command(["install", "-d", "-m755", home_bin_dir])
      unless result.success?
        MItamae.logger.error "Error: install -d -m755 #{home_bin_dir}"
        MItamae.logger.error result.stderr
        exit 2
      end

      %w[
        bq
        docker-credential-gcloud
        gcloud
        git-credential-gcloud.sh
        gsutil
      ].each do |exe|
        source = "#{tmpdir}/google-cloud-sdk/bin/#{exe}"
        result = run_command(["install", "-m755",
                              source, home_bin_dir])
        unless result.success?
          MItamae.logger.error "Unable to install #{exe}"
          MItamae.logger.error result.stderr
          exit 2
        end
      end
    end
  end
end
