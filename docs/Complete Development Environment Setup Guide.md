---
aliases:
  - Complete Development Environment Setup Guide
created: 2025-06-28T20:55:41
modified: 2025-06-29T09:24:54
linter-yaml-title-alias: Complete Development Environment Setup Guide
---

## Complete Development Environment Setup Guide

### Installation and Setup

Get your Windows machine running a full Linux environment in minutes: this section walks you through enabling WSL 2, installing Ubuntu 24.04 LTS, and configuring essential packages (build-tools, curl, git). Click here to ensure you have a reliable, performant shell for all your web-dev workflows.

[[WSL Installation and Setup]]

### Tools Installation

**Core Tools**
Everything you need to code, version, and edit: install Node via nvm, generate SSH keys for GitHub, and tune Git with aliases plus email/name settings. You’ll also install and configure VS Code (extensions + settings) so your editor “just works” out of the box. Click to equip yourself with the toolkit every modern project assumes.

**Git & GitHub**
- [[Configure Git Aliases & Defaults]]
- [[Generate SSH Keys & GitHub Access]]

**NVM & Node**
- [[Setup Node.js & nvm]]

**VS Code Settings**
- [[Install VS Code Extensions]]
- [[Apply VS Code Settings]]

### Scaffolding Scripts

This section provides a ready-to-use Bash script that automates every step of bootstrapping a new Eleventy site: it creates your project folder, initializes Git with a sensible `.gitignore`, installs and configures all necessary npm dependencies (Eleventy, PostCSS, Rollup, ESLint/Prettier, etc.), sets up your folder structure and configuration files, and even makes an initial commit so you can dive straight into development. Run it as `create-eleventy-project.sh <project-name>` and you’ll have a fully wired static-site project in seconds—no manual boilerplate required.

[[Create Eleventy Project Script]]

### NPM Packages

This section adds Netlify CLI, npm-check-updates, Lighthouse and serve as project-scoped development dependencies and wires them up to NPM scripts so you can, for example, run `npm run dev` to launch a live-reloading local server, `npm run preview` to serve your built files, `npm run update-deps` to bump and reinstall your dependencies, and `npm run audit` to generate a performance report—all without installing anything globally.

[[Install Project Dev Dependencies]]

### Netlify Setup

**Netlify Deploy**
Publish your site with confidence: learn how to install and log in with the Netlify CLI, set up `netlify.toml` for builds, redirects, and security headers, and run one-line deploy commands. Click to turn your local `_site` into a live URL without leaving the terminal.

[[Netlify Setup]]

### Backup and Sync Setup

**Backup & Restore**
Never lose your dotfiles or settings: this section provides a backup script to copy your `.bashrc`, `.gitconfig`, VS Code settings, SSH keys, plus a restore script to rehydrate everything on any machine. Click here to safeguard—and instantly migrate—your entire dev environment.

[[Backup and Sync Setup]]

### Docker Alternative (Optional)

For if you ever end up using docker

[[Docker Alternative (Optional)]]

### Quick Reference Commands

```bash
# Create new project
~/scripts/create-eleventy-project.sh my-new-site
# Create component
~/scripts/create-component.sh card
# Update all npm packages
ncu -u && npm install
# Deploy to Netlify
netlify deploy --prod
# Backup dev environment
~/scripts/backup-dev-setup.sh
```

### Troubleshooting

#### WSL Performance

```bash
# If npm is slow in WSL, store projects in WSL filesystem
cd ~
mkdir projects
# Work here instead of /mnt/c/...
```

#### Git Line Endings

```bash
# Configure Git for cross-platform development
git config --global core.autocrlf input
git config --global core.eol lf
```

#### VS Code WSL Integration

1. Open VS Code in Windows
2. Install "Remote - WSL" extension
3. Click green button bottom-left
4. Select "New WSL Window"
5. Open folder from Linux filesystem
Remember to run `~/scripts/backup-dev-setup.sh` after completing setup to create a portable backup!
