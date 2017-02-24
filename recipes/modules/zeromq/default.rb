case node[:platform]
when 'darwin'
  include_module 'libpgm'
  include_module 'libsodium'
  include_module 'norm'

  package 'zeromq' do
    options '--HEAD --with-libpgm --with-libsodium --with-norm'
  end
end
