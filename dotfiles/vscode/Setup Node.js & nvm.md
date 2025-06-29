---
aliases:
  - Setup Node.js & nvm
created: 2025-06-29T08:09:19
modified: 2025-06-29T08:09:21
linter-yaml-title-alias: Setup Node.js & nvm
---

## Install Node.js (via nvm)





```bash
# Install nvm - Chained CLI Commands
sudo apt update && sudo apt install -y curl && sudo apt upgrade -y && \
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash && \
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" && \
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
command -v nvm

# Reload shell configuration
source ~/.bashrc
# Install latest LTS Node
nvm install --lts
nvm use --lts
nvm alias default node
# Verify installation
node --version
npm --version
```

[The Odin Project - Installing Node Guide](https://www.theodinproject.com/lessons/foundations-installing-node-js)