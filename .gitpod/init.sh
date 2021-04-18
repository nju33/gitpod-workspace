#!/usr/bin/env bash

set -eux

init_code() {
  code --install-extension "$HOME/wdhongtw.gpg-indicator-0.3.4.vsix"
}

init_code
