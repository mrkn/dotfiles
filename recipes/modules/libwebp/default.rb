case node[:platform]
when 'darwin'
  include_module 'libjpeg'
  include_module 'libpng'
  include_module 'libtiff'
  include_module 'giflib'
  package 'webp'
end
