homebrew_available = system('/opt/brew/bin/brew commands >/dev/null 2>&1')
if not homebrew_available
  # make sure homebrew is available at first
  include_module 'homebrew'
else
  include_recipe 'common'
  begin
    include_recipe node[:hostname]
  rescue
  end
end
