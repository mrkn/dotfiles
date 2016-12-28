include_module 'openblas'

case node[:platform]
when 'darwin'
  package 'homebrew/science/r' do
    options '--with-openblas --with-pango'
  end
end
