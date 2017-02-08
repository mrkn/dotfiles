include_module 'libjpeg'
include_module 'libtiff'

package 'little-cms2' do
  options '--with-jpeg --with-libtiff'
end
