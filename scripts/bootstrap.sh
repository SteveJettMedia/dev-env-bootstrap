#!/usr/bin/env bash
set -euo pipefail

log() { printf "\n\033[1;34m▶ %s\033[0m\n" "$*"; }

# 1. Update & upgrade
log "Updating APT"
sudo apt update -y && sudo apt upgrade -y

# 2. Core packages
log "Installing core packages"
sudo apt install -y build-essential curl git firefox

# 3. NVM + Node LTS
if ! command -v nvm &>/dev/null; then
  log "Installing nvm"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi
export NVM_DIR="$HOME/.nvm"
# shellcheck source=/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
log "Installing latest Node LTS"
nvm install --lts

# 4. Global npm CLI tools
log "Installing global npm CLIs"
npm install -g netlify-cli npm-check-updates serve

# 5. Dotfile symlinks (add more as needed)
log "Linking dotfiles"
ln -svf "$PWD/dotfiles/.bashrc" "$HOME/.bashrc"
mkdir -p "$HOME/.config/Code/User"
ln -svf "$PWD/dotfiles/vscode/settings.json" \
        "$HOME/.config/Code/User/settings.json"

log "✅  All done – reload your shell!"
exec "$SHELL"

