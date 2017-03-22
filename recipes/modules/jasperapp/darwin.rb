jasper_version = "0.2.5"

install_app "Japser" do
  version jasper_version
  url "https://github.com/jasperapp/jasper/releases/download/v#{jasper_version}/jasper_v#{jasper_version}_mac.zip"
  sha256 "b7bd1f128032c90526bd11175f780c59c9118f801e5193d4571715dcb5f221a9"
end
