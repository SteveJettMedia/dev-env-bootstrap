---
source:
  - - Complete Development Environment Setup Guide
created: 2025-06-28
---
# Backup and Sync Setup

> Extracted from [[Complete Development Environment Setup Guide]] on 2025-06-28

---

### Backup and Sync Setup

#### Create Setup Backup Script

Save as `~/scripts/backup-dev-setup.sh`:

```bash
#!/bin/bash

BACKUP_DIR=~/dev-setup-backup
mkdir -p "$BACKUP_DIR"

# Backup configs
cp ~/.bashrc "$BACKUP_DIR/"
cp ~/.gitconfig "$BACKUP_DIR/"
cp -r ~/.ssh "$BACKUP_DIR/"
cp -r ~/.config/Code/User/settings.json "$BACKUP_DIR/vscode-settings.json"
code --list-extensions > "$BACKUP_DIR/vscode-extensions.txt"

# Backup scripts
cp -r ~/scripts "$BACKUP_DIR/"

# Create restore script
cat << 'EOF' > "$BACKUP_DIR/restore.sh"
#!/bin/bash
cp .bashrc ~/.bashrc
cp .gitconfig ~/.gitconfig
cp -r .ssh ~/.ssh
chmod 600 ~/.ssh/id_*
chmod 644 ~/.ssh/*.pub
mkdir -p ~/.config/Code/User
cp vscode-settings.json ~/.config/Code/User/settings.json
cat vscode-extensions.txt | xargs -L 1 code --install-extension
cp -r scripts ~/scripts
chmod +x ~/scripts/*.sh
EOF

chmod +x "$BACKUP_DIR/restore.sh"

echo "✅ Dev setup backed up to $BACKUP_DIR"
echo "📦 Create a zip: cd ~ && tar -czf dev-setup-backup.tar.gz dev-setup-backup/"
```


---

← Back to [[Complete Development Environment Setup Guide]]
