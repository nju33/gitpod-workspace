#!/usr/bin/env bash

set -eux

init_git() {
  git config --global include.path "$HOME/.dotfiles/.gitconfig"
}

init_ngrok() {
  set +ux
  if [ -n "$NGROK_AUTHTOKEN" ]; then
    ngrok authtoken "$NGROK_AUTHTOKEN"
  fi
  set -ux
}

init_gh() {
  set +ux
  if [ -n "$GH_AUTHTOKEN" ]; then
    gh auth login --with-token < <(echo "$GH_AUTHTOKEN")
  fi
  set -ux
}

init_git
init_ngrok
init_gh

echo 'Please execute following like'
echo '  init_code'

