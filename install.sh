#! /bin/bash

set -xe

export DESTDIR=${DESTDIR:-${HOME}}
export DOTFILES_REPO=https://github.com/mrkn/dotfiles

## Deploy

mkdir -p ${DESTDIR}/.dotfiles
cd ${DESTDIR}/.dotfiles
curl -fsSL ${DOTFILES_REPO}/tarball/master | /usr/bin/tar xz -m --strip 1


## Install mitamae

bin/install_mitamae


## Run mitamae

PATH=$HOME/bin:$PATH
mitamae local bootstrap.rb
