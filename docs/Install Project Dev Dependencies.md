---
aliases:
  - Install Project Dev Dependencies
created: 2025-06-29T08:59:35
modified: 2025-06-29T09:12:16
linter-yaml-title-alias: Install Project Dev Dependencies
---

## Setup Instructions

```bash
# From your project root, install project-scoped dev tools
npm install --save-dev netlify-cli npm-check-updates lighthouse serve
```

### Package Registry (current)

- **netlify-cli** — Netlify’s all-in-one tool for local builds, live reload, and one-command deploys
- **npm-check-updates** — Scans package.json and bumps your dependency ranges to the latest versions
- **lighthouse** — Generates performance, accessibility, SEO, and best-practices reports for any URL
- **serve** — Tiny static file server for quick previews of a built folder

### Example package.json

```json
{
  "name": "my-eleventy-site",
  "private": true,
  "scripts": {
    "dev": "netlify dev",
    "preview": "serve ./public",
    "update-deps": "npx npm-check-updates -u && npm install",
    "audit": "npx lighthouse http://localhost:8888 --view"
  },
  "devDependencies": {
    "netlify-cli": "^11.22.0",
    "npm-check-updates": "^16.15.0",
    "lighthouse": "^10.0.0",
    "serve": "^14.2.0"
  }
}
```

### Handy Script Commands

```bash
# Launch live-reloading local server
npm run dev

# Serve built files from ./public for a quick preview
npm run preview

# Bump all dependency ranges to the latest and reinstall
npm run update-deps

# Generate and open a Lighthouse performance report
npm run audit
```
