include_module 'openssl'

package 'mysql'

execute "launchctl load -w  $(brew --prefix mysql)/homebrew.mxcl.mysql.plist" do
  not_if "launchctl list | grep -q homebrew.mxcl.mysql"
end
