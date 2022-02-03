include_recipe 'helper'

ruby_version = '3.1.0'

def brew_latest_cellar_path(pkg)
  prefix = `brew --prefix #{pkg}`.chomp
  File.expand_path(File.readlink(prefix), File.dirname(prefix))
rescue => err
  p err
  raise
end

optflags = '-O3'

case node[:platform]
when 'darwin'
  debugflags = '-g'
  optflags = '-O3' if `uname -m`.chomp == "arm64"
  configure_opts = ->() {
    [
      "--with-opt-dir=#{`cd $(brew --prefix); pwd -P`.chomp}",
      "--with-dbm-dir=#{`cd $(brew --prefix qdbm); pwd -P`.chomp}",
      "--with-dbm-type=qdbm",
      "--with-gdbm-dir=#{`cd $(brew --prefix gdbm); pwd -P`.chomp}",
      "--with-libyaml-dir=#{`cd $(brew --prefix libyaml); pwd -P`.chomp}",
      "--with-openssl-dir=#{`cd $(brew --prefix openssl); pwd -P`.chomp}",
      "--with-readline-dir=#{`cd $(brew --prefix readline); pwd -P`.chomp}",
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
  configure_args ->() { configure_opts.() + ["--disable-install-doc", "optflags=-O0"] }
  make_jobs 4
end

alias_version = ruby_version.split('.')[0, 2].join('.')
execute "~/.rbenv/bin/rbenv alias #{alias_version} #{ruby_version}" do
  user node[:user] if node[:user]
end
