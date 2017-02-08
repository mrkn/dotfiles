include_module 'cairo'
include_module 'glib'
include_module 'gobject-introspection'

package 'harfbuzz' do
  options %w[
    --with-cairo
    --with-graphite2
    --with-freetype
    --with-glib
    --with-gobject-introspection
    --with-icu4c
  ].join(' ')
end
