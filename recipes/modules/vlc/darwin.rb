vlc_version = '2.2.4'

install_app 'VLC' do
  version vlc_version
  url "http://vlc.letterboxdelivery.org/vlc/#{vlc_version}/macosx/vlc-#{vlc_version}.dmg"
  sha256 'fd071b9817c9efccac5a144d69893a4a5323cbde4a74d5691c3cf3ab979d4160'
end
