export PYENV_ROOT=$HOME/.pyenv
PATH=$PYENV_ROOT/bin:$PATH

if which pyenv >/dev/null; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
