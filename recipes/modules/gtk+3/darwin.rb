include_module 'gdk-pixbuf'
include_module 'atk'
include_module 'gobject-introspection'
include_module 'pango'
include_module 'glib'
include_module 'gsettings-desktop-schemas'
include_module 'jasper'

package 'gtk+3' do
  options '--with-jasper --with-quartz-relocation --with-gsettings-desktop-schemas'
end
