#!/usr/bin/env bash

set -eux

init_gpg() {
  local secretkey="tmpsecretkey"
  echo "$GPG_SECRET_KEY_NJU33" | base64 --decode >"$secretkey"

  gpg --batch --import --allow-secret-key-import "$secretkey"

  shred --remove "$secretkey"
}

init_git_around_gpg() {
  git config --global user.signingkey "$GIT_USER_SIGNINGKEY"
  git config --global commit.gpgsign true
  git config --global tag.gpgsign true
}

init_code() {
  code --install-extension "$HOME/wdhongtw.gpg-indicator-0.3.4.vsix"
}

init_gpg
init_git_around_gpg
init_code
