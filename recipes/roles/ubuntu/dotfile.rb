include_module 'dotfile'

# bash/zsh
dotfile '.aliases'
dotfile '.bash_profile'
dotfile '.zprofile'
dotfile '.profile.d/000_locale.sh'
dotfile '.profile.d/101_cache.sh'
dotfile '.profile.d/200_functions.sh'
dotfile '.profile.d/500_rbenv.sh'
dotfile '.profile.d/510_python.sh'
dotfile '.profile.d/520_goenv.sh'
dotfile '.profile.d/520_gopath.sh'
dotfile '.profile.d/530_rust.sh'
dotfile '.profile.d/540_julia.sh'
dotfile '.profile.d/900_home_bin.sh'
dotfile '.profile.d/910_aliases.sh'
dotfile '.profile.d/999_local_profile.bash'
dotfile '.profile.d/999_local_profile.zsh'

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
dotfile '.config/alacritty/alacritty.toml'
