if [ -d $HOME/.bash_profile.d ]; then
  for profile in $HOME/.bash_profile.d/*.sh; do
    [ -x $profile ] && . $profile
  done
  unset profile
fi
. "$HOME/.cargo/env"

export PATH="$HOME/.poetry/bin:$PATH"
