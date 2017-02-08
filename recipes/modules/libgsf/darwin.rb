include_module 'glib'
include_module 'gdk-pixbuf'

package 'libgsf' do
  options '--with-gdk-pixbuf'
end
