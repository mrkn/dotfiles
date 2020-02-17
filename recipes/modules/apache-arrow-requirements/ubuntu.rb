package 'wget'
package 'software-properties-common'
package 'gpg-agent'

llvm_version = 7
llvm_apt_url = "http://apt.llvm.org/bionic/"
llvm_apt_arch = "llvm-toolchain-bionic-#{llvm_version}"
execute "wget -q -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -"
execute %Q[apt-add-repository -y --update "deb #{llvm_apt_url} #{llvm_apt_arch} main"]
package "clang-#{llvm_version}"
package "clang-format-#{llvm_version}"
package "clang-tidy-#{llvm_version}"
package "llvm-#{llvm_version}-dev"

package 'autoconf'
package 'bison'
package 'ca-certificates'
package 'ccache'
package 'cmake'
package 'flex'
package 'g++'
package 'gcc'
package 'gdb'
package 'git'
package 'libbenchmark-dev'
package 'libboost-filesystem-dev'
package 'libboost-regex-dev'
package 'libboost-system-dev'
package 'libbrotli-dev'
package 'libbz2-dev'
package 'libgflags-dev'
package 'liblz4-dev'
package 'libprotobuf-dev'
package 'libprotoc-dev'
package 'libre2-dev'
package 'libsnappy-dev'
package 'libssl-dev'
package 'libzstd-dev'
package 'ninja-build'
package 'pkg-config'
package 'protobuf-compiler'
package 'rapidjson-dev'
package 'thrift-compiler'
package 'tzdata'

package 'gtk-doc-tools'
package 'lcov'
package 'libgirepository1.0-dev'
package 'libdouble-conversion-dev'
package 'valgrind'

include_recipe 'python'
