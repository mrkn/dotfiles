execute "wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -"

file "/etc/apt/sources.list.d/llvm.list" do
  owner "root"
  group "root"
  content <<APT_LINES
deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-10 main
deb-src http://apt.llvm.org/bionic/ llvm-toolchain-bionic-10 main

deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-9 main
deb-src http://apt.llvm.org/bionic/ llvm-toolchain-bionic-9 main
APT_LINES
end

execute "apt-get update"

package "llvm-10"
package "clang-10"
package "lldb-10"
package "lld-10"
package "libfuzzer-10-dev"
package "libc++-10-dev"
package "libc++abi-10-dev"
package "libomp-10-dev"
package "libclang-10-dev"

package "llvm-9"
package "clang-9"
package "lldb-9"
package "lld-9"
package "libfuzzer-9-dev"
package "libc++-9-dev"
package "libc++abi-9-dev"
package "libomp-9-dev"
package "libclang-9-dev"
