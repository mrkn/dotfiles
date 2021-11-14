execute "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y" do
  not_if "test -x $HOME/.cargo/bin/cargo"
end

execute "rustup override set stable"
execute "rustup update stable"
