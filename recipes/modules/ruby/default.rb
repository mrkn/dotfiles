include_recipe 'prerequisites'

include_recipe '3.4'
execute 'rbenv global 3.4'

include_recipe '3.3'
include_recipe '3.2'
include_recipe '3.1'
include_recipe '3.0'
include_recipe '2.7'
include_recipe '2.6'
include_recipe '2.5'
include_recipe '2.4'
include_recipe 'master'
