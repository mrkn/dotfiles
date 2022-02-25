include_module 'dotfile'

case node[:platform]
when 'darwin'
  include_module 'gcc'

  package 'openblas' do
    options '--with-openmp'
  end
else 'ubuntu'
  package 'libopenblas-dev'
  package 'libopenblas-openmp-dev'
  package 'libopenblas-pthread-dev'

  # for numpy
  dotfile '.numpy-site.cfg' do
    source '.numpy-site.ubuntu.cfg'
  end
end
