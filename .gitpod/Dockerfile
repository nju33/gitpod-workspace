FROM gitpod/workspace-full

# Install custom tools, runtime, etc.
RUN sudo apt-get update \
  && sudo apt-get install -y expect tmux \
  && sudo rm -rf /var/lib/apt/lists/*

# Apply user-specific settings
# ENV ...

# Install custom tools, runtime, etc.
RUN brew install gibo thefuck

COPY --chown=gitpod:gitpod .gitpod/.bash_user_init "$HOME/.bashrc.d/.bash_user_init"
COPY --chown=gitpod:gitpod .gitpod/.thefuck_init "$HOME/.bashrc.d/.thefuck_init"
