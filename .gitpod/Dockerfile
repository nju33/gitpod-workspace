FROM gitpod/workspace-full

# Install custom tools, runtime, etc.
RUN sudo apt-get update \
  && sudo apt-get install -y expect tmux \
  && sudo rm -rf /var/lib/apt/lists/*

# Apply user-specific settings
# ENV ...

# Install custom tools, runtime, etc.
RUN brew install gibo thefuck

COPY --chown=gitpod:gitpod .gitpod/.bashrc.d/gpg "$HOME/.bashrc.d/33-gpg"
COPY --chown=gitpod:gitpod .gitpod/.bashrc.d/thefuck "$HOME/.bashrc.d/33-thefuck"
