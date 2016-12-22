include_module 'autoconf'
include_module 'bison'

optflags = '-O3 -mtune=native -march=native'
debugflags = '-g3 -gdwarf-4'

install_ruby_trunk(
  configure_args: [
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
    "optflags=#{optflags}",
    "debugflags=#{debugflags}"
  ],
  make_jobs: 4
)
