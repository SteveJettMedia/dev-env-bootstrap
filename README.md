# Dev-Env Bootstrap

One-stop repo to install & configure my Linux dev stack (Ubuntu 24.04+, Node, Eleventy, VS Code, Firefox, etc.).

## Quick install

```bash
git clone https://github.com/<YOUR-USER>/dev-env-bootstrap.git
cd dev-env-bootstrap
bash scripts/bootstrap.sh
```

## Contents

- **scripts/** – automated installers & helpers  
- **docs/** – step-by-step setup guides  
- **dotfiles/** – editor & shell configurations  

## Prerequisites

- Ubuntu 24.04 LTS (or similar Debian-based distro)  
- `git`, `curl` installed  


---

## 5) `scripts/bootstrap.sh`

Save as `scripts/bootstrap.sh` and make executable:

```bash
#!/usr/bin/env bash
set -euo pipefail

echo "🔄  Updating APT repos…"
sudo apt update -y && sudo apt upgrade -y

echo "📦  Installing base packages…"
sudo apt install -y build-essential curl git

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

echo "✅  Bootstrap complete! Please restart your shell."
bash
Copy
Edit
chmod +x scripts/bootstrap.sh
```

## Usage

After running `bash scripts/bootstrap.sh`, your machine will have:
1. Core packages (`build-essential`, `curl`, `git`, `firefox`)  
2. NVM & Node.js LTS  
3. Global npm tools (`netlify-cli`, `npm-check-updates`, `serve`)  

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
   └─ vscode/settings.json
```

## Contributing

1. Fork & clone this repo  
2. Create a feature branch: `git checkout -b feat/my-change`  
3. Commit with Conventional Commits (`feat:`, `fix:`, `docs:`)  
4. Push & open a PR against `main`  
5. Tag releases with `git tag -a vX.Y.Z -m "Release vX.Y.Z"`  

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history.

