execute "git clone https://github.com/rbenv/rbenv.git ~/.rbenv" do
  not_if "test -d ~/.rbenv/.git"
end

execute "cd ~/.rbenv && git pull --rebase" do
  not_if "test ! -d ~/.rbenv/.git"
end

execute "git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build" do
  not_if "test -d ~/.rbenv/plugins/ruby-build/.git"
end

execute "cd ~/.rbenv/plugins/ruby-build && git pull --rebase" do
  not_if "test ! -d ~/.rbenv/plugins/ruby-build/.git"
end
