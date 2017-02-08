include_module 'open-mpi'

package 'fftw' do
  options '--with-fortran --with-mpi --with-openmp'
end
