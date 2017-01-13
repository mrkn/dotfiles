case node[:platform]
when 'darwin'
  include_module 'libogg'
  package 'flac' do
    options '--with-libogg'
  end
end
