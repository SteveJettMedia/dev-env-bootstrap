#!/usr/bin/env bash
set -euo pipefail

log() { printf "\n\033[1;34m▶ %s\033[0m\n" "$*"; }

log "Updating APT repos"
sudo apt update -y && sudo apt upgrade -y

log "Installing core packages"
sudo apt install -y build-essential curl git firefox

# ── Node via nvm ────────────────────────────────
if ! command -v nvm &>/dev/null; then
  log "Installing nvm"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
log "Installing latest Node LTS"
nvm install --lts

log "Global npm CLI tools"
npm install -g netlify-cli npm-check-updates serve

# ── Dotfile symlinks ───────────────────────────
log "Linking dotfiles"
mkdir -p "$HOME/.config/Code/User"
ln -svf "$PWD/dotfiles/vscode/settings.json" "$HOME/.config/Code/User/settings.json"

log "✅  Done — reload your shell"
exec "$SHELL"
