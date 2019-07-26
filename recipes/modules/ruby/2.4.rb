include_recipe 'helper'

ruby_version = '2.4.6'

def brew_latest_cellar_path(pkg)
  prefix = `brew --prefix #{pkg}`.chomp
  File.expand_path(File.readlink(prefix), File.dirname(prefix))
end

optflags = '-O3 -mtune=native -march=native'

case node[:platform]
when 'darwin'
  debugflags = '-g'
  configure_opts = ->() {
    [
      "--with-opt-dir=#{`brew --prefix`.chomp}",
      "--with-dbm-dir=#{brew_latest_cellar_path('qdbm')}",
      "--with-dbm-type=qdbm",
      "--with-gdbm-dir=#{brew_latest_cellar_path('gdbm')}",
      "--with-libyaml-dir=#{brew_latest_cellar_path('libyaml')}",
      "--with-openssl-dir=#{brew_latest_cellar_path('openssl')}",
      "--with-readline-dir=#{brew_latest_cellar_path('readline')}",
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
execute "rbenv alias #{alias_version} #{ruby_version}"
