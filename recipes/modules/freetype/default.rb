case node[:platform]
when 'darwin'
  include_module 'libpng'
  package 'freetype'
end
