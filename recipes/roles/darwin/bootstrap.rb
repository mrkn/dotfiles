# Darwin bootstrap recipe

## Install homebrew

homebrew_install_script = "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
execute %Q[/bin/bash -c "$(curl -fsSL ${homebrew_install_script)"] do
  not_if "test -x /opt/homebrew/bin/brew"
end

unless ENV["PATH"].include?("/opt/homebrew/bin")
  ENV['PATH'] = "#{brew_prefix}/bin:#{ENV['PATH']}"
end
