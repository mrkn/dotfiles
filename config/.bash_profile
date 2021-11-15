if [ -d $HOME/.profile.d ]; then
  for profile in $HOME/.profile.d/*.{ba,}sh; do
    [ -x $profile ] && source $profile
  done
  unset profile
fi

if [ -d $HOME/.cargo/env ]; then
  source "$HOME/.cargo/env"
fi

export PATH="$HOME/.poetry/bin:$PATH"
