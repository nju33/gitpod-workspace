FROM gitpod/workspace-full

# Install custom tools, runtime, etc.
RUN sudo apt-get update \
  && sudo apt-get install -y expect tmux \
  && sudo rm -rf /var/lib/apt/lists/*

# Apply user-specific settings
# ENV ...

# Install yvm
RUN curl -s https://raw.githubusercontent.com/tophat/yvm/master/scripts/install.js | node

WORKDIR "$HOME"
RUN git clone https://github.com/nju33/.dotfiles.git \
  && cd .dotfiles \
  && ln -s "$(pwd)/.bash_aliases" "$HOME/.bash_aliases" \
  && ln -s "$(pwd)/.agignore" "$HOME/.agignore" \
  && ln -s "$(pwd)/.tmux.conf" "$HOME/.tmux.conf" \
  && mkdir -p "$HOME/.config" && ln -s "$(pwd)/.config_starship.toml" "$HOME/.config/starship.toml"

# Install custom tools, runtime, etc.
RUN cd .dotfiles \
  && sed -i -e "/asciinema\|azure-cli\|git-lfs\|imagemagick\|python\|ruby\|webp\|tmux\|jq\|tree\|vim\|gnupg\|nginx\|the_silver_searcher\|peco\|monolith\|ngrok/d" Brewfile \
  && brew bundle

COPY --chown=gitpod:gitpod .gitpod/.bashrc.d/gpg "$HOME/.bashrc.d/33-gpg"
COPY --chown=gitpod:gitpod .gitpod/.bashrc.d/thefuck "$HOME/.bashrc.d/33-thefuck"
COPY --chown=gitpod:gitpod .gitpod/.bashrc.d/starship "$HOME/.bashrc.d/33-starship"
COPY --chown=gitpod:gitpod .gitpod/extensions/wdhongtw.gpg-indicator-0.3.4.vsix "$HOME/wdhongtw.gpg-indicator-0.3.4.vsix"

