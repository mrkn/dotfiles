include_module 'freetype'
include_module 'fontconfig'
include_module 'libpng'
include_module 'glib'

package 'cairo' do
  options '--without-x11'
end
