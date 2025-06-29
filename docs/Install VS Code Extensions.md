---
aliases:
  - Install VS Code Extensions
created: 2025-06-29T08:14:57
modified: 2025-06-29T08:17:32
linter-yaml-title-alias: Install VS Code Extensions
---

## Install VS Code Extensions

Create a file `~/.vscode-extensions.txt`:

```
# Core Development
ms-vscode-remote.remote-wsl
esbenp.prettier-vscode
dbaeumer.vscode-eslint
ritwickdey.liveserver
formulahendry.auto-rename-tag
naumovs.color-highlight

# Git
eamodio.gitlens
donjayamanne.githistory

# Web Development
ecmel.vscode-html-css
zignd.html-css-class-completion
pranaygp.vscode-css-peek

# Eleventy/Nunjucks
ronnidc.nunjucks
phoenisx.cssvar

# JavaScript
xabikos.javascriptsnippets
christian-kohler.path-intellisense

# Productivity
wayou.vscode-todo-highlight
gruntfuggly.todo-tree
alefragnani.project-manager
```

Install extensions via command:

```bash
# Save extension list
code --list-extensions > ~/.vscode-extensions.txt

# Install from list
cat ~/.vscode-extensions.txt | xargs -L 1 code --install-extension
```
