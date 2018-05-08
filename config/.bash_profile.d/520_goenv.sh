export GOENV_ROOT=$HOME/.goenv
PATH=$GOENV_ROOT/bin:$PATH

if which goenv >/dev/null; then
  eval "$(goenv init -)"
fi
