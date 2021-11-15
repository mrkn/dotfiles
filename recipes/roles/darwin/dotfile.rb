include_module 'dotfile'

# bash
dotfile '.bash_aliases'
dotfile '.bash_profile'
dotfile '.profile.d/000_locale.sh'
dotfile '.profile.d/100_homebrew.sh'
dotfile '.profile.d/101_cache.sh'
dotfile '.profile.d/200_functions.sh'
dotfile '.profile.d/500_rbenv.sh'
dotfile '.profile.d/530_rust.sh'
dotfile '.profile.d/800_iterm2.sh'
dotfile '.profile.d/810_vscode.sh'
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

# Alacritty
dotfile '.config/alacritty/alacritty.yml'

# Markdown Preview Enhanced on VSCode
dotfile '.mume/style.less'
