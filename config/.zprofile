setopt nonomatch

if [ -d $HOME/.profile.d ]; then
  for profile in $(echo $HOME/.profile.d/*.{z,}sh); do
    [ -x $profile ] && source $profile
  done
  unset profile
fi

setopt nomatch

export PATH="$HOME/.poetry/bin:$PATH"
