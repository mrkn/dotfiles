case node[:platform]
when 'darwin'
  include_module 'libpgm'
  include_module 'libsodium'
  include_module 'norm'

  package 'zeromq' do
    options '--with-libpgm --with-libsodium --with-norm'
  end
end
