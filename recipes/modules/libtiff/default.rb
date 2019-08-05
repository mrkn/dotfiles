case node[:platform]
when 'darwin'
  include_module 'xz'
  package 'libtiff'
end
