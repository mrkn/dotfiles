case node[:platform]
when 'darwin'
  include_module 'zeromq'

  package 'czmq'
end
