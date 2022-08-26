execute "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y" do
  not_if "test -x $HOME/.cargo/bin/cargo"
end

ENV["PATH"] = "#{ENV["HOME"]}/.cargo/bin:#{ENV["PATH"]}"

execute "rustup override set stable"
execute "rustup update stable"
