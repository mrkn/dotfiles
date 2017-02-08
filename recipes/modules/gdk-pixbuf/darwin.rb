include_module 'glib'
include_module 'libjpeg'
include_module 'libtiff'
include_module 'libpng'
include_module 'gobject-introspection'
include_module 'shared-mime-info'

package 'gdk-pixbuf' do
  options '--with-modules'
end
