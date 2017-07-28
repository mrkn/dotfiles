package 'llvm' do
  options %w[
    --with-graphviz
    --with-lldb
    --with-ocaml
    --with-python
    --with-shared-libs
    --with-toolchain
    --with-compiler-rt
    --with-libcxx
    --with-libffi
  ].join(' ')
end
