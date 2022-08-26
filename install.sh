#! /bin/bash

set -xe

export DESTDIR=${DESTDIR:-${HOME}}
export DOTFILES_REPO=https://github.com/mrkn/dotfiles

## Deploy

mkdir -p ${DESTDIR}/.dotfiles
cd ${DESTDIR}/.dotfiles
if [ -x /bin/tar ]; then
  TAR=/bin/tar
elif [ -x /usr/bin/tar ]; then
  TAR=/usr/bin/tar
else
  TAR=$(which tar)
fi
curl -fsSL ${DOTFILES_REPO}/tarball/master | $TAR xz -m --strip 1


## Install mitamae

bin/install_mitamae


## Run mitamae

PATH=$HOME/bin:$PATH
mitamae local -l debug bootstrap.rb
