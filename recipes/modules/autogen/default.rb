case node[:platform]
when 'darwin'
  include_module 'guile'
  package 'autogen'
end
