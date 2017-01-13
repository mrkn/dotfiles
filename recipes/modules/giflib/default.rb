case node[:platform]
when 'darwin'
  package 'giflib' do
    options '--without-x11'
  end
end
