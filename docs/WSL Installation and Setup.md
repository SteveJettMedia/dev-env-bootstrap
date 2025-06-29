---
aliases:
  - WSL Installation and Setup
created: 2025-06-28T21:39:00
modified: 2025-06-29T07:55:18
linter-yaml-title-alias: WSL Installation and Setup
source:
  - - dev-environment-setup
---

## WSL Installation and Setup

> Extracted from [[Complete Development Environment Setup Guide]] on 2025-06-28

---

### Install WSL2

```bash
# 1) Ensure WSL defaults to version 2
wsl --set-default-version 2

# 2) Install Ubuntu 24.04 LTS specifically
wsl --install -d Ubuntu-24.04

# 3) (Optional) Verify your distro and WSL version
wsl -l -v

# 4) Update the WSL kernel and components
wsl --update
```

### Initial WSL Configuration

```bash
# Update packages
sudo apt update && sudo apt upgrade -y
# Install build essentials
sudo apt install build-essential curl file git -y
```

---

← Back to [[Complete Development Environment Setup Guide]]
