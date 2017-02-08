include_module 'libjpeg'
include_module 'libtiff'

package 'little-cms' do
  options '--with-jpeg --with-libtiff'
end
