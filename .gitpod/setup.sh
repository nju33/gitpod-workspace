#!/usr/bin/env bash

set -eu

init_gpg() {
  local secretkey="tmpsecretkey"
  echo "$GPG_SECRET_KEY_NJU33" | base64 --decode >"$secretkey"

  gpg --batch --import --allow-secret-key-import "$secretkey"

  shred --remove "$secretkey"
}

init_bash() {
  local parentdir="$HOME/.bashrc.d"
  
  if [ ! -d "$parentdir" ]; then
    mkdir "$parentdir"
  fi

  echo "export GPG_TTY=\"$(tty)\"" >"$parentdir/gpg"
}

init_git() {
  git config --global user.signingkey "$GIT_USER_SIGNINGKEY"
  git config --global commit.gpgsign true
  git config --global tag.gpgsign true
}

init_gpg
init_bash
init_git
