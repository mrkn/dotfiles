package 'wget'
package 'software-properties-common'
package 'gpg-agent'

llvm_version = 10
clang_tools_version = 8

ubuntu_codename = case node[:platform_version]
                  when '18.04'
                    'bionic'
                  when '20.04'
                    'focal'
                  end

apt_url = "http://apt.llvm.org/#{ubuntu_codename}/"
apt_arch = "llvm-toolchain-#{ubuntu_codename}-#{llvm_version}"
execute "wget -q -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -"
execute %Q[apt-add-repository -y --update "deb #{apt_url} #{apt_arch} main"]
package "clang-#{llvm_version}"
package "llvm-#{llvm_version}-dev"

package "clang-format-#{clang_tools_version}"
package "clang-tidy-#{clang_tools_version}"

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
package 'libgoogle-glog-dev'
package 'liblz4-dev'
package 'libprotobuf-dev'
package 'libprotoc-dev'
package 'libre2-dev'
package 'libsnappy-dev'
package 'libssl-dev'
package 'libutf8proc-dev'
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
