case node[:platform]
when 'darwin'
  package 'ghq'
when 'ubuntu'
  include_module 'golang'
  execute 'go get github.com/motemen/ghq'
end
