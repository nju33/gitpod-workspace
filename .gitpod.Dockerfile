FROM gitpod/workspace-full

# Install custom tools, runtime, etc.
# RUN sudo apt-get update \
#   && sudo apt-get install -y \
#   && sudo rm -rf /var/lib/apt/lists/*

# Apply user-specific settings
# ENV ...

# Install custom tools, runtime, etc.
RUN brew install gibo thefuck