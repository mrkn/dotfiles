include_recipe 'helper'

optflags = '-O3 -mtune=native -march=native'
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

install_ruby '2.2.10' do
  configure_args configure_opts + ["optflags=#{optflags}"]
  make_jobs 4
end

install_ruby '2.2.10' do
  variation_name '2.2.10-o0'
  configure_args configure_opts + ["optflags=-O0"]
  make_jobs 4
end

execute 'rbenv alias 2.2 2.2.10'
