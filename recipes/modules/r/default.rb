include_module 'openblas'

case node[:platform]
when 'darwin'
  package 'r'
end
