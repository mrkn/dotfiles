case node[:platform]
when 'darwin'
  include_module 'libogg'
  package 'libvorbis'
end
