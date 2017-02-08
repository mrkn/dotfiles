include_module 'glib'
include_module 'cairo'
include_module 'harfbuzz'
include_module 'fontconfig'
include_module 'gobject-introspection'

package 'pango' do
  options '--without-x11'
end
