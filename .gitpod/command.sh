#!/usr/bin/env bash

set -eux

init_git() {
  git config --global include.path "$HOME/.dotfiles/.gitconfig"
  
  set +ux
  if [ -n "$GLITCH_REMOTE_URL" ]; then
    git remote add glitch "$GLITCH_REMOTE_URL"
  fi
  set -ux
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

init_navi() {
  local github_user="$(echo $GITPOD_WORKSPACE_CONTEXT | jq -r .repository.owner)"
  local remote_url="https://github.com/$github_user/cheats.git"
  local target_dir="$(navi info cheats-path)/${github_user}__cheats"
  
  if ! git ls-remote --exit-code "$remote_url" > /dev/null 2>&1; then
    return
  fi
  
  if [ -d "$target_dir" ]; then
    cd "$target_dir" && git clone origin main
  else
    git clone "$remote_url" "$target_dir"
  fi
}

init_git
init_ngrok
init_gh
init_navi

echo 'Please execute following like'
echo '  init_code'

