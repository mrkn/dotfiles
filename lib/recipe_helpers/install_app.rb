install_app_args = {
  version: nil,
  url: nil,
  sha256: nil,
  archive_name: nil,
  app_name: nil,
  open_after_install: false
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
  downloads_dir = File.expand_path('~/Downloads')
  download_path = File.join(downloads_dir, archive_name)

  app_name = params[:app_name] || name
  app_path = File.join('/Applications', "#{app_name}.app")
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

      # Download archive

      unless download_file(url, archive_name, downloads_dir, sha256)
        exit 2
      end

      # Uninstall existing version

      run_command(['rm', '-rf', app_path])

      # Install new version

      if run_command("file -bI '#{download_path}' | grep -q application/zip >&/dev/null")
        run_command("zip --delete '#{download_path}' '*.DS_Store' || :")
        run_command("zip --delete '#{download_path}' '*__MACOSX*' || :")
      end

      unless run_command(['unzip', '-x', '-d', '/Applications', download_path])
        MItamae.logger.error "install_app[#{name}] Failed due to unable to extract the archive."
	exit 2
      end

      if params[:open_after_install]
        run_command(['open', app_path])
      end
    end
  end
end
