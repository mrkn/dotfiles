case node[:platform]
when 'darwin'
  openssl_formula = File.expand_path("../openssl@1.0.rb", __FILE__)
  package openssl_formula
  package 'openssl@1.1'
  package 'openssl'
when 'ubuntu'
  # TODO
end
