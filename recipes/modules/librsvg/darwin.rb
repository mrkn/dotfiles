include_module 'cairo'
include_module 'gdk-pixbuf'
include_module 'glib'
include_module 'libcroco'
include_module 'pango'
include_module 'gtk+3'
include_module 'libgsf'

package 'librsvg' do
  options '--with-gtk+3 --with-libgsf'
end
