include_module 'dotfile'

dotfile '.bash_profile'
dotfile '.bash_profile.d'
dotfile '.tmux.conf'
dotfile '.dein.toml'
dotfile '.vimrc'

include_module 'homebrew'
include_module 'git'

execute 'brew update'

include_module 'mas'
include_module 'slack'
include_module 'tweetbot'
include_module 'evernote'
include_module 'quiver'
include_module 'lv'
include_module 'highway'
include_module 'xz'
include_module 'tmux'
include_module 'iterm2'

include_module 'dropbox'
include_module '1password'

include_module 'rbenv'
include_module 'ruby'

execute 'rbenv global 2.4'

include_module 'pyenv'
include_module 'python'

include_module 'jupyter'

include_module 'r'

include_module 'neovim'
include_module 'terraform'

include_module 'duet'
