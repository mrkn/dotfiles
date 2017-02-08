include_module 'little-cms2'
include_module 'libtiff'
include_module 'libpng'

package 'openjpeg' do
  options '--with-static --without-doxygen'
end
