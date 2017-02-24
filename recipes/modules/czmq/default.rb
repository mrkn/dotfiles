case node[:platform]
when 'darwin'
  include_module 'zeromq'

  package 'czmq' do
    options '--HEAD'
  end
end
