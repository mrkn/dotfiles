include_module 'dotfile'
include_module 'homebrew'
include_module 'git'

execute 'brew update'

include_module 'mas'
include_module 'slack'
include_module 'lv'
include_module 'highway'

include_module 'rbenv'
include_module 'ruby'

include_module 'terraform'

dotfile '.bash_profile'
dotfile '.bash_profile.d'
