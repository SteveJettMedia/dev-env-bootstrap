---
aliases:
  - Apply VS Code Settings
created: 2025-06-29T08:15:04
modified: 2025-06-29T08:18:26
linter-yaml-title-alias: Apply VS Code Settings
---

## VS Code Settings

Create `~/.config/Code/User/settings.json`:

```json
{
  // Editor preferences
  "editor.lineNumbers": "relative",
  "editor.minimap.enabled": false,
  "editor.wordWrap": "on",
  "editor.accessibilitySupport": "off",
  "editor.tabSize": 2,
  "files.autoSave": "onFocusChange",
  "files.eol": "\n",
  "editor.formatOnSave": true,
  "editor.formatOnPaste": false,
  "editor.formatOnType": false,

  // Workbench preferences
  "workbench.editor.showTabs": "single",
  "workbench.startupEditor": "none",
  "workbench.colorTheme": "Default Dark Modern",

  // Explorer preferences
  "explorer.confirmDelete": false,
  "explorer.confirmDragAndDrop": false,

  // Security
  "security.workspace.trust.untrustedFiles": "open",

  // Live Server (keeping for static site preview)
  "liveServer.settings.CustomBrowser": "microsoft-edge",
  "liveServer.settings.donotShowInfoMsg": true,

  // Formatting – Prettier as default formatter
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "prettier.enable": true,
  "prettier.requireConfig": true,
  "prettier.ignorePath": ".prettierignore",

  // ESLint configuration
  "eslint.enable": true,
  "eslint.alwaysShowStatus": true,
  "eslint.validate": [
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "html"
  ],

  // Code Actions – ESLint fixes on save
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
  },

  // Language-specific formatters
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[javascriptreact]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[json]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[html]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[css]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[markdown]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode",
    "editor.formatOnSave": false
  },
  "[nunjucks]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },

  // File associations
  "files.associations": {
    "*.njk": "nunjucks",
    "*.html": "html",
    ".eleventy.js": "javascript"
  },

  // Emmet support
  "emmet.includeLanguages": {
    "nunjucks": "html",
    "njk": "html"
  },

  // Git
  "git.autofetch": true,
  "git.confirmSync": false,

  // WSL Integration
  "terminal.integrated.defaultProfile.windows": "Ubuntu (WSL)",

  // Hide build and dependency folders
  "files.exclude": {
    "**/node_modules": true,
    "**/dist": true,
    "**/_site": true
  }
}
```