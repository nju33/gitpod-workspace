FROM gitpod/workspace-full

# Install custom tools, runtime, etc.
RUN sudo apt-get update \
  && sudo apt-get install -y chromium-browser libgtk-3-dev libnss3-dev expect tmux \
  && sudo rm -rf /var/lib/apt/lists/*

# Apply user-specific settings
ENV NODE_OPTIONS=--max_old_space_size=4096

RUN npm install --global @google/clasp bit-bin caniuse-cmd npm-home npm pageres-cli tldr vercel

# Install yvm
RUN curl -s https://raw.githubusercontent.com/tophat/yvm/master/scripts/install.js | node

WORKDIR "$HOME"
RUN git clone https://github.com/nju33/.dotfiles.git \
  && cd .dotfiles \
  && ln -s "$(pwd)/.bash_aliases" "$HOME/.bash_aliases" \
  && ln -s "$(pwd)/.agignore" "$HOME/.agignore" \
  && ln -s "$(pwd)/.tmux.conf" "$HOME/.tmux.conf" \
  && mkdir -p "$HOME/.config" && ln -s "$(pwd)/.config_starship.toml" "$HOME/.config/starship.toml"
  
RUN curl -ongrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip \
  && sudo unzip ngrok.zip -d /usr/local/bin \
  && rm ngrok.zip
  
# Install azure-cli
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install aws-cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && sudo ./aws/install \
  && rm awscliv2.zip

# Install custom tools, runtime, etc.
RUN cd .dotfiles \
  && sed -i -e "/azure-cli\|git-lfs\|imagemagick\|python\|ruby\|webp\|tmux\|jq\|tree\|vim\|gnupg\|nginx\|the_silver_searcher\|peco\|monolith\|ngrok\|unrar\|duf\|sed/d" Brewfile \
  && brew bundle

COPY --chown=gitpod:gitpod .gitpod/.bashrc.d/gpg "$HOME/.bashrc.d/33-gpg"
COPY --chown=gitpod:gitpod .gitpod/.bashrc.d/thefuck "$HOME/.bashrc.d/33-thefuck"
COPY --chown=gitpod:gitpod .gitpod/.bashrc.d/starship "$HOME/.bashrc.d/33-starship"
COPY --chown=gitpod:gitpod .gitpod/.bashrc.d/code "$HOME/.bashrc.d/33-code"
COPY --chown=gitpod:gitpod .gitpod/.bashrc.d/zoxide "$HOME/.bashrc.d/33-zoxide"
COPY --chown=gitpod:gitpod .gitpod/extensions/wdhongtw.gpg-indicator-0.3.4.vsix "$HOME/wdhongtw.gpg-indicator-0.3.4.vsix"

