install_app_args = {
  version: nil,
  url: nil,
  sha256: nil,
  archive_name: nil,
  app_name: nil,
  open_after_install: false,
  installer_name: nil,
  install_by: :copy
}

valid_values_of_install_by = [ :copy, :open ]

define :install_app, install_app_args do
  name = params[:name]
  version = params[:version]
  sha256 = params[:sha256]

  install_by = params[:install_by].to_sym
  unless valid_values_of_install_by.include? install_by
    MItamae.logger.error "install_app[#{name}] Invalid value of install_by: #{install_by}"
    exit 2
  end

  unless (url = params[:url])
    MItamae.logger.error "install_app[#{name}] Failed because url is not given."
    exit 2
  end

  archive_name = params[:archive_name] || File.basename(url)
  downloads_dir = File.expand_path('~/Downloads')
  download_path = File.join(downloads_dir, archive_name)

  app_name = params[:app_name] || "#{name}.app"
  app_path = File.join('/Applications', app_name)
  info_plist_path = File.join(app_path, 'Contents', 'Info.plist')

  version_key = 'CFBundleShortVersionString'

  installer_name = params[:installer_name] || app_name

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

      # Download archive

      unless download_file(url, archive_name, downloads_dir, sha256)
        exit 2
      end

      # Uninstall existing version

      run_command(['rm', '-rf', app_path])

      # Install new version

      if run_command("file -bI '#{download_path}' | grep -q application/zip >&/dev/null", error: false).success?
        # ZIP File

        run_command("zip --delete '#{download_path}' '*.DS_Store' || :")
        run_command("zip --delete '#{download_path}' '*__MACOSX*' || :")

        unless run_command(['unzip', '-x', '-d', '/Applications', download_path], error: false).success?
          MItamae.logger.error "install_app[#{name}] Failed due to unable to extract the archive."
          exit 2
        end
      elsif download_path.end_with?('.dmg')
        # DMG file

        mktmpdir do |tmpdir|
          mountpoint = File.join(tmpdir, 'vol')
          result = run_command("hdiutil attach '#{download_path}' -readonly -mountpoint '#{mountpoint}'", error: false)
          unless result.success?
            MItamae.logger.error "install_app[#{name}] Failed due to unable to mount dmg file."
            MItamae.logger.error result.stderr
            exit 2
          end

          begin
            installer_path = File.join(mountpoint, installer_name)
            case params[:install_by].to_sym
            when :copy
              run_command(['cp', '-R', installer_path, app_path])
            when :open
              run_command(['open', '-W', installer_path])
            end
          ensure
            run_command(['hdiutil', 'detach', mountpoint])
          end
        end
      end

      if params[:open_after_install]
        run_command(['open', app_path])
      end
    end
  end
end
