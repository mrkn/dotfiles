homebrew_prefix = ENV.fetch("HOMEBREW_PREFIX", "/opt/homebrew")

unless ENV["PATH"].include?("#{homebrew_prefix}/bin")
  ENV['PATH'] = "#{homebrew_prefix}/bin:#{ENV['PATH']}"
end

execute "brew update"
