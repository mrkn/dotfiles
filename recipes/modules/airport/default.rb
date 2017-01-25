case node[:platform]
when 'darwin'
  link File.expand_path('~/bin/airport') do
    to '/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
    force true
  end
end
