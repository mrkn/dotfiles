include_recipe 'common'

begin
  include_recipe node[:hostname]
rescue
end
