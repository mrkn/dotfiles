include_module 'dotfile'

# bash
dotfile '.bash_aliases'
dotfile '.bash_profile'
dotfile '.bash_profile.d/000_locale.sh'
dotfile '.bash_profile.d/101_cache.sh'
dotfile '.bash_profile.d/200_functions.sh'
dotfile '.bash_profile.d/500_rbenv.sh'
dotfile '.bash_profile.d/900_home_bin.sh'
dotfile '.bash_profile.d/910_aliases.sh'
dotfile '.bash_profile.d/999_local_profile.sh'

# git
dotfile '.gitconfig'

# rubygems
dotfile '.gemrc'

# vim
dotfile '.config/nvim/init.vim'
dotfile '.dein.toml'
dotfile '.vimrc'
