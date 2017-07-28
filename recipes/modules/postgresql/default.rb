case node[:platform]
when 'darwin'
  package 'postgresql'

  execute "launchctl load -w  $(brew --prefix postgresql)/homebrew.mxcl.postgresql.plist" do
    not_if "launchctl list | grep -q homebrew.mxcl.postgresql"
  end
end
