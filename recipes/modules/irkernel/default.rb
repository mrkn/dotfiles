install_script = File.expand_path('../install_irkernel.R', __FILE__)

execute "Rscript --vanilla --verbose #{install_script}" do
  not_if "jupyter-kernelspec list | grep -q ir >&/dev/null"
end
