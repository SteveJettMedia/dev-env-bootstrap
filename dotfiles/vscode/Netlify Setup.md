---
aliases:
  - Netlify Setup
created: 2025-06-28T21:45:21
modified: 2025-06-29T09:18:23
linter-yaml-title-alias: Netlify Setup
source:
  - - Complete Development Environment Setup Guide
---

## Netlify Setup

> Extracted from [[Complete Development Environment Setup Guide]] on 2025-06-28

---

### Netlify Setup

#### Install Netlify CLI

```bash
# Login to Netlify
netlify login
# Initialize site (in project directory)
netlify init
# Deploy
netlify deploy
netlify deploy --prod
```

#### Create netlify.toml

```toml
[build]
  command = "npm run build"
  publish = "_site"
[build.environment]
  NODE_VERSION = "18"
[[redirects]]
  from = "/*"
  to = "/404.html"
  status = 404
[[headers]]
  for = "/*"
  [headers.values]
    X-Frame-Options = "DENY"
    X-XSS-Protection = "1; mode=block"
    X-Content-Type-Options = "nosniff"
    Referrer-Policy = "strict-origin-when-cross-origin"
```

---

← Back to [[Complete Development Environment Setup Guide]]
