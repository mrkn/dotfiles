unless ENV["PATH"].include?("/opt/homebrew/bin")
  ENV['PATH'] = "#{brew_prefix}/bin:#{ENV['PATH']}"
end

execute "brew update"
