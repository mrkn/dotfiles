include_recipe 'lib/recipe_helper'

case node[:platform]
when 'ubuntu'
  node[:user]  = 'mrkn'
  node[:group] = 'mrkn'
end
