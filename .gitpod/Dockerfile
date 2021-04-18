FROM gitpod/workspace-full

# Install custom tools, runtime, etc.
RUN sudo apt-get update \
  && sudo apt-get install -y expect tmux \
  && sudo rm -rf /var/lib/apt/lists/*

# Apply user-specific settings
# ENV ...

# Install custom tools, runtime, etc.
RUN brew install gibo starship thefuck

COPY --chown=gitpod:gitpod .gitpod/.bashrc.d/gpg "$HOME/.bashrc.d/33-gpg"
COPY --chown=gitpod:gitpod .gitpod/.bashrc.d/thefuck "$HOME/.bashrc.d/33-thefuck"
COPY --chown=gitpod:gitpod .gitpod/.bashrc.d/starship "$HOME/.bashrc.d/33-starship"
COPY --chown=gitpod:gitpod .gitpod/extensions/wdhongtw.gpg-indicator-0.3.4.vsix "$HOME/wdhongtw.gpg-indicator-0.3.4.vsix"

WORKDIR "$HOME"
RUN git clone https://github.com/nju33/.dotfiles.git \
  && cd .dotfiles \
  && sh lns.sh
