include_recipe 'prerequisites'
include_recipe 'helper'

ruby_version = '2.7.5'
optflags = '-O3 -mtune=native -march=native'

case node[:platform]
when 'darwin'
  optflags = '-O3' if `uname -m`.chomp == "arm64"
  debugflags = '-g'

  configure_opts = ->() {
    [
      "--with-opt-dir=#{`brew --prefix`.chomp}",
      "--with-dbm-dir=#{`brew --prefix qdbm`.chomp}",
      "--with-dbm-type=qdbm",
      "--with-gdbm-dir=#{`brew --prefix gdbm`.chomp}",
      "--with-libffi-dir=#{`brew --prefix libffi`.chomp}",
      "--with-libyaml-dir=#{`brew --prefix libyaml`.chomp}",
      "--with-openssl-dir=#{`brew --prefix openssl@1.1`.chomp}",
      "--with-readline-dir=#{`brew --prefix readline`.chomp}",
      "--disable-install-doc",
      "--enable-shared",
      "--enable-dtrace",
      "debugflags=#{debugflags}"
    ]
  }
else
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

alias_version = ruby_version.split('.')[0, 2].join('.')
execute "~/.rbenv/bin/rbenv alias #{alias_version} #{ruby_version}" do
  user node[:user] if node[:user]
end
