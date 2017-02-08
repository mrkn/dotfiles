include_module 'libevent'

package 'open-mpi' do
  options '--with-mpi-thread-multiple --with-fortran'
end
