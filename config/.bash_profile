if [ -d $HOME/.bash_profile.d ]; then
  for profile in $HOME/.bash_profile.d/*.sh; do
    [ -x $profile ] && source $profile
  done
  unset profile
fi

if [ -d $HOME/.cargo/env ]; then
  source "$HOME/.cargo/env"
fi

export PATH="$HOME/.poetry/bin:$PATH"
