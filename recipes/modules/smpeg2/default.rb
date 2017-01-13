case node[:platform]
when 'darwin'
  include_module 'sdl2'
  package 'smpeg2'
end
