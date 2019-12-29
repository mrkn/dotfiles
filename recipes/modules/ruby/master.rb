include_recipe 'helper'

def brew_latest_cellar_path(pkg)
  prefix = `brew --prefix #{pkg}`.chomp
  File.expand_path(File.readlink(prefix), File.dirname(prefix))
end

optflags = '-O3 -mtune=native -march=native'

case node[:platform]
when 'darwin'
  debugflags = '-g'
  configure_opts = [
    "--with-opt-dir=#{`brew --prefix`.chomp}",
    "--with-dbm-dir=#{`brew --prefix qdbm`.chomp}",
    "--with-dbm-type=qdbm",
    "--with-gdbm-dir=#{`brew --prefix gdbm`.chomp}",
    "--with-libyaml-dir=#{`brew --prefix libyaml`.chomp}",
    "--with-openssl-dir=#{`brew --prefix openssl`.chomp}",
    "--with-readline-dir=#{`brew --prefix readline`.chomp}",
    "--disable-install-doc",
    "--enable-shared",
    "--enable-dtrace",
    "debugflags=#{debugflags}"
  ]
else
  debugflags = '-g3 -gdwarf-4'
  configure_opts = [
    "--with-dbm-type=qdbm",
    "--disable-install-doc",
    "--enable-shared",
    "debugflags=#{debugflags}"
  ]
end

install_ruby :master do
  configure_args configure_opts + ["optflags=#{optflags}"]
  make_jobs 4
  force true
end

install_ruby :master do
  variation_name "master-o0"
  configure_args configure_opts + ["optflags=-O0"]
  make_jobs 4
  force true
end
