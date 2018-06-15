gitter_version = "1.177"

install_app "Gitter" do
  version gitter_version
  url "https://s3.amazonaws.com/update.gitter.im/osx/Gitter-#{gitter_version}.dmg"
  sha256 "0ca1c0d52c342548afbea8d3501282a4ccf494058aa2e23af27e09198a7a30a4"
end
