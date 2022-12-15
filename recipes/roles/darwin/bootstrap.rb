# Darwin bootstrap recipe

## Install homebrew

if File.directory?("/opt/homebrew/bin")
  brew_prefix = "/opt/homebrew"
else
  brew_prefix = "/opt/brew"
end

homebrew_install_script = "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
execute %Q[/bin/bash -c "$(curl -fsSL ${homebrew_install_script)"] do
  not_if "test -x #{brew_prefix}"
end

brew_bin_dir = File.join(brew_prefix, "bin")
unless ENV["PATH"].include?(brew_bin_dir)
  ENV["PATH"] = "#{brew_bin_dir}:#{ENV["PATH"]}"
end
