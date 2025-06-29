---
aliases:
  - Generate SSH Keys & GitHub Access
created: 2025-06-29T08:05:39
modified: 2025-06-29T08:05:40
linter-yaml-title-alias: Generate SSH Keys & GitHub Access
---

## Create SSH Key for GitHub

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "stevejettmedia@gmail.com"
# Start SSH agent
eval "$(ssh-agent -s)"
# Add SSH key
ssh-add ~/.ssh/id_ed25519
# Display public key (copy this to GitHub)
cat ~/.ssh/id_ed25519.pub
```
