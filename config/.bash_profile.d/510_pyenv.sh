export PYENV_ROOT=$HOME/.pyenv
PATH=$PYENV_ROOT/bin:$PATH

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
