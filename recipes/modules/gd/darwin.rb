include_module 'fontconfig'
include_module 'freetype'
include_module 'libjpeg'
include_module 'libpng'
include_module 'libtiff'
include_module 'libwebp'

package 'gd' do
  options '--with-fontconfig --with-freetype --with-jpeg --with-libpng --with-libtiff --with-webp'
end
