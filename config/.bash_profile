if [ -d $HOME/.profile.d ]; then
  for profile in $HOME/.profile.d/*.{ba,}sh; do
    [ -x $profile ] && source $profile
  done
  unset profile
fi
