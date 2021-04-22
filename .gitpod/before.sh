#!/usr/bin/env bash

set -eux

init_gpg() {
  set +u
  if [ -n "$GPG_SECRET_KEY_NJU33" ]; then
    gpg --batch --import --allow-secret-key-import <(echo "$GPG_SECRET_KEY_NJU33" | base64 --decode)
  fi
  set -u
}

init_git_around_gpg() {
  git config --global user.signingkey "$GIT_USER_SIGNINGKEY"
  git config --global commit.gpgsign true
  git config --global tag.gpgsign true
}

init_zoxide() {
  cp "$GITPOD_REPO_ROOT/.gitpod/zoxide/db.zo" "$HOME/.local/share/zoxide/"
}

init_gpg
init_git_around_gpg
init_zoxide
