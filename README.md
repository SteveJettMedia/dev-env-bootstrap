
# Dev-Env Bootstrap

One‑stop repo to install & configure my Linux dev stack  
(Ubuntu 24.04 +, Node.js, Eleventy, VS Code, Firefox, etc.)

---

## Quick install

```bash
git clone https://github.com/<YOUR-USER>/dev-env-bootstrap.git
cd dev-env-bootstrap
bash scripts/bootstrap.sh
```

---

## Contents

- **scripts/** – automated installers & helpers  
- **docs/** – step‑by‑step setup guides  
- **dotfiles/** – shell & editor configurations  

---

## Prerequisites

- Ubuntu 24.04 LTS (or similar Debian‑based distro)  
- `git` & `curl` installed  

---

## What the bootstrap script installs

1. Core APT packages: `build-essential`, `curl`, `git`, `firefox`  
2. **NVM & Node.js** – latest LTS release  
3. Global npm CLIs: `netlify-cli`, `npm-check-updates`, `serve`  
4. Symlinks for dotfiles (`.bashrc`, VS Code settings) into your home folder  
5. Reloads the current shell so everything is ready immediately

---

## Bootstrap script (`scripts/bootstrap.sh`)

Save this file as `scripts/bootstrap.sh` and make it executable (`chmod +x scripts/bootstrap.sh`):

```bash
#!/usr/bin/env bash
set -euo pipefail

echo "🔄  Updating APT repos…"
sudo apt update -y && sudo apt upgrade -y

echo "📦  Installing base packages…"
sudo apt install -y build-essential curl git firefox

# Install NVM & Node.js LTS
if ! command -v nvm &>/dev/null; then
  echo "🌀  Installing nvm…"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  # shellcheck source=/dev/null
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

echo "🟢  Installing Node.js LTS…"
nvm install --lts

echo "🔧  Installing global npm tools…"
npm install -g netlify-cli npm-check-updates serve

# Symlink dotfiles
ln -svf "$PWD/dotfiles/.bashrc" "$HOME/.bashrc"
ln -svf "$PWD/dotfiles/vscode/settings.json" \
        "$HOME/.config/Code/User/settings.json"

echo "✅  Bootstrap complete! Reloading shell…"
exec "$SHELL"
```

---

## Repository structure

```text
dev-env-bootstrap/
├─ README.md
├─ CHANGELOG.md
├─ .gitignore
├─ docs/
│  ├─ wsl-setup.md
│  ├─ vscode-setup.md
│  └─ eleventy-guide.md
├─ scripts/
│  ├─ bootstrap.sh
│  └─ create-eleventy-project.sh
└─ dotfiles/
   ├─ .bashrc
   └─ vscode/
      └─ settings.json
```

---

## Contributing

1. Fork & clone this repo  
2. Create a feature branch  
   ```bash
   git checkout -b feat/your-change
   ```  
3. Commit with Conventional Commits (`feat:`, `fix:`, `docs:`)  
4. Push & open a PR against **main**  
5. Tag releases  
   ```bash
   git tag -a vX.Y.Z -m "Release vX.Y.Z"
   git push --tags
   ```

---

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history.
