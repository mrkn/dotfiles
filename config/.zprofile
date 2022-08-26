if [ -d $HOME/.profile.d ]; then
  for profile in $HOME/.profile.d/*.{z,}sh; do
    [ -x $profile ] && source $profile
  done
  unset profile
fi

export PATH="$HOME/.poetry/bin:$PATH"
