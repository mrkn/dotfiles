case node[:platform]
when 'darwin'
  package 'gcc' do
    options '--with-jit --without-nls --with-fortran --without-multilib'
  end
else
  package 'gcc'
  package 'gcc-c++'
end
