case node[:platform]
when 'darwin'
  include_module 'flac'
  include_module 'libogg'
  include_module 'libvorbis'
  package 'libsndfile'
end
