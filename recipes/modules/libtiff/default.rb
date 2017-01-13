case node[:platform]
when 'darwin'
  include_module 'xz'
  package 'libtiff' do
    options '--with-xz'
  end
end
