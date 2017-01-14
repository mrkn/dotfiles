install_script = File.expand_path('../install_ijulia.jl', __FILE__)

julia = File.expand_path('~/bin/julia')
execute "#{julia} #{install_script}" do
  not_if "jupyter-kernelspec list | grep -q julia >&/dev/null"
end
