install_app_args = {
  version: nil,
  url: nil,
  sha256: nil,
  archive_name: nil,
  app_name: nil
}
define :install_app, install_app_args do
  name = params[:name]
  version = params[:version]
  sha256 = params[:sha256]

  unless (url = params[:url])
    MItamae.logger.error "install_app[#{name}] Failed because url is not given."
    exit 2
  end

  archive_name = params[:archive_name] || File.basename(url)
  download_path = File.expand_path(File.join('~/Downloads', archive_name))

  app_name = params[:app_name] || name
  app_path = File.join('Applications', "#{app_name}.app")
  info_plist_path = File.join(app_path, 'Contents', 'Info.plist')

  version_key = 'CFBundleShortVersionString'

  local_ruby_block "Install #{name}" do
    block do
      if File.file?(info_plist_path)
        existing_version = `defaults read '#{info_plist_path}' #{version_key}`.chomp
      end

      need_to_install =   existing_version.nil?
      need_to_install ||= version && (version > existing_version)
      unless need_to_install
        MItamae.logger.debug "install_app[#{name}] Execution skipped because of version checking"
	next
      end

      # Check existing archive and download if needed

      if File.file?(download_path) && sha256
        unless run_command("echo '#{sha256}  #{download_path}' | shasum -a 256 -cs -")
          run_command(['rm', '-f', download_path])
        end
      end

      # Download and check archive

      unless File.file?(download_path)
        run_command(['curl', '-sfSL', '-o', download_path, url])
        unless File.file?(download_path)
          MItamae.logger.error "install_app[#{name}] Failed due to downloading failure."
          exit 2
        end

        # Check downloaded archive

        if sha256
          unless run_command("echo '#{sha256}  #{download_path}' | shasum -a 256 -cs -")
            MItamae.logger.error "install_app[#{name}] Failed due to invalid sha256."
            exit 2
          end
        end
      end

      # Uninstall existing version

      run_command(['rm', '-rf', app_path])

      # Install new version

      unless run_command(['unzip', '-x', '-d', '/Applications', download_path])
        MItamae.logger.error "install_app[#{name}] Failed due to unable to extract the archive."
	exit 2
      end
    end
  end
end
