include_module 'dotfile'

# bash
dotfile '.aliases'
dotfile '.profile'
dotfile '.profile.d/000_locale.sh'
dotfile '.profile.d/101_cache.sh'
dotfile '.profile.d/200_functions.sh'
dotfile '.profile.d/500_rbenv.sh'
dotfile '.profile.d/520_gopath.sh'
dotfile '.profile.d/530_rust.sh'
dotfile '.profile.d/900_home_bin.sh'
dotfile '.profile.d/910_aliases.sh'
dotfile '.profile.d/999_local_profile.sh'

# git
dotfile '.gitconfig'
dotfile '.gitignore_global'

# ruby
dotfile '.gemrc'
dotfile '.irbrc'

# tmux
dotfile '.tmux.conf'

# vim
dotfile '.config/nvim/init.vim'
dotfile '.dein.toml'
dotfile '.vimrc'

# Alcaritty
dotfile '.config/alacritty/alacritty.yml'
