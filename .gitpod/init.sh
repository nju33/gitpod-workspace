#!/usr/bin/env bash

set -eux

init_git() {
  git config --global include.path="$HOME/.dotfiles/.gitconfig"
}

init_code() {
  code --install-extension "$HOME/wdhongtw.gpg-indicator-0.3.4.vsix"
}

init_ngrok() {
  set +u
  if [ -n "$NGROK_AUTHTOKEN" ]; then
    ngrok authtoken "$NGROK_AUTHTOKEN"
  fi
  set -u
}

init_git
init_code
init_ngrok
