#!/usr/bin/env bash

set -eux

init_git() {
  git config --global include.path="$HOME/.dotfiles/.gitconfig" | :
}

init_ngrok() {
  set +u
  if [ -n "$NGROK_AUTHTOKEN" ]; then
    ngrok authtoken "$NGROK_AUTHTOKEN"
  fi
  set -u
}

init_gh() {
  set +u
  if [ -n "$GH_AUTHTOKEN" ]; then
    gh auth login --with-token < <(echo "$GH_AUTHTOKEN")
  fi
  set -u
}

init_git
init_ngrok
init_gh
