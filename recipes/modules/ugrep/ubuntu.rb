if node[:platform_version] >= "22.04"
  package "ugrep"
else
  force_install = ENV["UPDATE_UGREP"]
  version = "3.9.5"
  url = "https://github.com/Genivia/ugrep/archive/refs/tags/v#{version}.tar.gz"
  src_dir = File.join(ENV["HOME"], ".ugrep_source")

  execute "rm -rf #{src_dir}" do
    if force_install
      only_if "test -d #{src_dir}"
    else
      only_if "test ! -x $HOME/bin/ugrep"
    end
  end

  directory src_dir do
    only_if "test ! -x $HOME/bin/ugrep" unless force_install
    user node[:user] if node[:user]
    group node[:group] if node[:group]
  end

  execute "curl -fsSL #{url} | tar xz --strip 1 -C #{src_dir}" do
    only_if "test ! -x $HOME/bin/ugrep" unless force_install
    user node[:user] if node[:user]
  end

  package "libpcre2-dev libz-dev libbz2-dev liblzma-dev liblz4-dev libzstd-dev" do
    only_if "test ! -x $HOME/bin/ugrep" unless force_install
  end

  execute "./build.sh --enable-pager --enable-pretty" do
    only_if "test ! -x $HOME/bin/ugrep" unless force_install
    cwd src_dir
    user node[:user] if node[:user]
  end

  execute "install bin/ugrep $HOME/bin" do
    only_if "test ! -x $HOME/bin/ugrep" unless force_install
    cwd src_dir
    user node[:user] if node[:user]
  end

  execute "install bin/ug $HOME/bin" do
    only_if "test ! -x $HOME/bin/ug" unless force_install
    cwd src_dir
    user node[:user] if node[:user]
  end
end
