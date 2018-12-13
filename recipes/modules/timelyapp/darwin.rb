timely_version = '0.4.8'
timely_sha256 = '2184d8ed6e951e2cf1d5da22626740c8825d2bfea4fd9f7b83e771d219e86622'

memory_tracker_version = '1.2.1'
memory_tracker_sha256 = '27090399425913f4c319a9073511a229176c61a8fe280087a8280fd87a5c5f31'

install_app 'Timely' do
  version timely_version
  url "https://github.com/Timely/desktop-releases/releases/download/osx64-v#{timely_version}/Timely-#{timely_version}.dmg"
  sha256 timely_sha256
end

install_app 'Memory Tracker' do
  version memory_tracker_version
  url "https://timelytimetracking.s3.amazonaws.com/mac_tracker/Memory%20Tracker%20by%20Timely.zip"
  sha256 memory_tracker_sha256
end
