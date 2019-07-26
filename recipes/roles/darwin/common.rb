include_recipe 'dotfile'

include_module 'homebrew'
include_module 'git'

execute 'brew update'

include_module 'mas'

include_module 'airport'
include_module 'alfred'
include_module 'bartender'
include_module 'the_unarchiver'
include_module 'istat_menus'
include_module 'dropbox'
include_module '1password'
include_module 'google_chrome'
include_module 'rescue_time'
include_module 'neovim'
include_module 'vscode'
include_module 'slack'
include_module 'tweetbot'
include_module 'evernote'
include_module 'iterm2'
include_module 'google_drive'
include_module 'skype'
include_module 'spark'
include_module 'kindle'
include_module 'pixelmator'
include_module 'duet'
include_module 'papers'
include_module 'dash'
include_module 'docker'
include_module 'trailer_app'

include_module 'lv'
include_module 'highway'
include_module 'xz'
include_module 'tmux'
include_module 'peco'
include_module 'ghq'
include_module 'hub'
include_module 'ctags'
include_module 'envchain'
include_module 'amazon-ecs-cli'
include_module 'terraform'

include_module 'rapidjson'
include_module 'apache-arrow'

include_module 'python'
pip_package 'neovim'

include_module 'rbenv'
include_module 'ruby'
execute 'rbenv global 2.4'
gem_package 'neovim'

include_module 'jupyter'
include_module 'gem-src'

include_module 'iruby'

include_module 'llvm'
include_module 'julia'
include_module 'ijulia'

include_module 'r'
#include_module 'irkernel'
#include_module 'rstudio-desktop'

include_module 'nodejs'
include_module 'yarn'

include_module 'golang'

include_module 'mactex'

include_module 'jasperapp'

include_module 'postgresql'
include_module 'postgis'
include_module 'mysql'
include_module 'sequel_pro'
include_module 'postico'

include_module 'imagemagick'

include_module 'apache-arrow-helper-scripts'
