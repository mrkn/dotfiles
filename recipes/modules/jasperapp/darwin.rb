jasper_version = "0.5.0"

install_app "Japser" do
  version jasper_version
  url "https://github.com/jasperapp/jasper/releases/download/v#{jasper_version}/jasper_v#{jasper_version}_mac.zip"
  sha256 "962a38ad3a928894289643fd47febfdeb585c2e712c73dba23487edb940b25cd"
end
