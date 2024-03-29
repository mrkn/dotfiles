include_recipe 'prerequisites'
include_recipe 'helper'

ruby_version = '2.3.8'
optflags = '-O3 -mtune=native -march=native'

case node[:platform]
when 'darwin'
  optflags = '-O3' if `uname -m`.chomp == "arm64"
  debugflags = '-g'

  configure_opts = ->() {
    [
      "--with-opt-dir=#{`cd $(brew --prefix); pwd -P`.chomp}",
      "--with-dbm-dir=#{`cd $(brew --prefix qdbm); pwd -P`.chomp}",
      "--with-dbm-type=qdbm",
      "--with-gdbm-dir=#{`cd $(brew --prefix gdbm); pwd -P`.chomp}",
      "--with-libffi-dir=#{`cd $(brew --prefix libffi); pwd -P`.chomp}",
      "--with-libyaml-dir=#{`cd $(brew --prefix libyaml); pwd -P`.chomp}",
      "--with-openssl-dir=#{`cd $(brew --prefix openssl@1.0); pwd -P`.chomp}",
      "--with-readline-dir=#{`cd $(brew --prefix readline); pwd -P`.chomp}",
      "--disable-install-doc",
      "--enable-shared",
      "--enable-dtrace",
      %q(CPPFLAGS=-DUSE_FFI_CLOSURE_ALLOC),
      %q(CFLAGS=-Wno-compound-token-split-by-macro),
      "debugflags=#{debugflags}"
    ]
  }
else
  restore_libssl_dev = true
  package 'libssl1.0-dev'

  debugflags = '-g3 -gdwarf-4'
  configure_opts = ->() {
    [
      "--with-dbm-type=qdbm",
      "--disable-install-doc",
      "--enable-shared",
      "debugflags=#{debugflags}"
    ]
  }
end

install_ruby ruby_version do
  configure_args ->() { configure_opts.() + ["optflags=#{optflags}"] }
  make_jobs 4
end

install_ruby ruby_version do
  variation_name "#{ruby_version}-o0"
  configure_args ->() { configure_opts.() + ["optflags=-O0"] }
  make_jobs 4
end

package 'libssl-dev' if restore_libssl_dev

alias_version = ruby_version.split('.')[0, 2].join('.')
execute "rbenv alias #{alias_version} #{ruby_version}"
