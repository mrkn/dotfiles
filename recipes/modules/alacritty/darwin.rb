ver = "0.9.0"

include_module "rust"

clone_dir = File.expand_path("~/src/github.com/alacritty/alacritty")

directory File.dirname(clone_dir)

git clone_dir do
  repository "git@github.com:alacritty/alacritty.git"
end

execute "make app" do
  cwd clone_dir
end

execute "cp -r target/release/osx/Alacritty.app /Applications/" do
  cwd clone_dir
end
