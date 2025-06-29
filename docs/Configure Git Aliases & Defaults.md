---
aliases:
  - Configure Git Aliases & Defaults
created: 2025-06-29T08:01:12
modified: 2025-06-29T08:02:13
linter-yaml-title-alias: Configure Git Aliases & Defaults
---

## Git Configuration

```bash
# Set up Git credentials
git config --global user.name "Steven Ayvar"
git config --global user.email "stevejettmedia@gmail.com"
# Set up default branch name
git config --global init.defaultBranch main
# Default Reconciliation Behavior
git config --global pull.rebase false
# Useful aliases
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.cm commit
git config --global alias.lg "log --oneline --graph --decorate"
```

[The Odin Project - Git Setup Guide](https://www.theodinproject.com/lessons/foundations-setting-up-git)