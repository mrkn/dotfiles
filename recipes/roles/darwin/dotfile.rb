include_module 'dotfile'

# bash
dotfile '.bash_aliases'
dotfile '.bash_profile'
dotfile '.bash_profile.d/000_locale.sh'
dotfile '.bash_profile.d/100_homebrew.sh'
dotfile '.bash_profile.d/101_cache.sh'
dotfile '.bash_profile.d/200_functions.sh'
dotfile '.bash_profile.d/500_rbenv.sh'
dotfile '.bash_profile.d/510_pyenv.sh'
dotfile '.bash_profile.d/800_iterm2.sh'
dotfile '.bash_profile.d/810_vscode.sh'
dotfile '.bash_profile.d/900_home_bin.sh'
dotfile '.bash_profile.d/910_aliases.sh'
dotfile '.bash_profile.d/999_local_profile.sh'

# git
dotfile '.gitconfig'

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
