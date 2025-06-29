---
aliases:
  - Create Eleventy Project Script
created: 2025-06-29T08:32:30
modified: 2025-06-29T08:32:32
linter-yaml-title-alias: Create Eleventy Project Script
---

Save as `~/scripts/create-eleventy-project.sh`:

```bash
#!/bin/bash
# Check if project name is provided
if [ -z "$1" ]; then
  echo "Usage: create-eleventy-project.sh <project-name>"
  exit 1
fi
PROJECT_NAME=$1
cd ~/projects || exit
# Create project directory
mkdir "$PROJECT_NAME" && cd "$PROJECT_NAME" || exit
# Initialize Git
git init
# Create .gitignore
cat << EOF > .gitignore
# Dependencies
node_modules/
package-lock.json
# Build outputs
_site/
dist/
.cache/
# Environment
.env
.env.local
.env.*.local
# Editor
.vscode/
.idea/
*.swp
*.swo
*~
# OS
.DS_Store
Thumbs.db
# Logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*
# Temporary files
*.tmp
*.temp
EOF
# Initialize npm
npm init -y
# Install Eleventy and development dependencies
npm install --save-dev @11ty/eleventy @11ty/eleventy-img @11ty/eleventy-navigation @11ty/eleventy-plugin-syntaxhighlight
# Install build tools
npm install --save-dev npm-run-all rimraf postcss postcss-cli autoprefixer cssnano rollup @rollup/plugin-node-resolve @rollup/plugin-terser
# Install linting tools
npm install --save-dev eslint prettier eslint-config-prettier eslint-plugin-prettier
# Create folder structure
mkdir -p src/{_data,_includes/{components,layouts},assets/{css,js,img,fonts},pages,posts}
# Create Eleventy config
cat << 'EOF' > .eleventy.js
const eleventyNavigationPlugin = require("@11ty/eleventy-navigation");
const syntaxHighlight = require("@11ty/eleventy-plugin-syntaxhighlight");
const Image = require("@11ty/eleventy-img");
module.exports = function(eleventyConfig) {
  eleventyConfig.addPlugin(eleventyNavigationPlugin);
  eleventyConfig.addPlugin(syntaxHighlight);
  eleventyConfig.addPassthroughCopy("src/assets/img");
  eleventyConfig.addPassthroughCopy("src/assets/fonts");
  eleventyConfig.addWatchTarget("src/assets/css/");
  eleventyConfig.addWatchTarget("src/assets/js/");
  eleventyConfig.addNunjucksAsyncShortcode("image", async function(src, alt, sizes) {
    let metadata = await Image(src, {
      widths: [300, 600, 1200],
      formats: ["webp", "jpeg"],
      outputDir: "./_site/img/"
    });
    let imageAttributes = { alt, sizes, loading: "lazy", decoding: "async" };
    return Image.generateHTML(metadata, imageAttributes);
  });
  return {
    dir: { input: "src", output: "_site", includes: "_includes", data: "_data" },
    templateFormats: ["njk", "md", "html"],
    htmlTemplateEngine: "njk",
    markdownTemplateEngine: "njk"
  };
};
EOF
# Create package.json scripts
cat << 'EOF' > scripts-temp.json
{
  "scripts": {
    "clean": "rimraf _site",
    "dev:eleventy": "eleventy --serve",
    "dev:css": "postcss src/assets/css/main.css -o _site/css/style.css --watch",
    "dev:js": "rollup -c -w",
    "dev": "npm-run-all clean --parallel dev:*",
    "build:eleventy": "eleventy",
    "build:css": "postcss src/assets/css/main.css -o _site/css/style.css",
    "build:js": "rollup -c",
    "build": "npm-run-all clean build:*",
    "lint": "eslint src/assets/js",
    "format": "prettier --write \"**/*.{js,json,css,md,njk,html}\""
  }
}
EOF
node -e "
const fs = require('fs');
const pkg = require('./package.json');
const scripts = require('./scripts-temp.json');
pkg.scripts = scripts.scripts;
fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2));
"
rm scripts-temp.json
# Create PostCSS config
cat << EOF > postcss.config.js
module.exports = {
  plugins: [
    require('autoprefixer'),
    require('cssnano')({ preset: 'default' })
  ]
};
EOF
# Create Rollup config
cat << 'EOF' > rollup.config.js
import { nodeResolve } from '@rollup/plugin-node-resolve';
import terser from '@rollup/plugin-terser';
const production = !process.env.ROLLUP_WATCH;
export default {
  input: 'src/assets/js/main.js',
  output: { file: '_site/js/bundle.js', format: 'iife', sourcemap: !production },
  plugins: [nodeResolve(), production && terser()]
};
EOF
# Create ESLint config
cat << EOF > .eslintrc.js
module.exports = {
  env: { browser: true, es2021: true, node: true },
  extends: ['eslint:recommended','plugin:prettier/recommended'],
  parserOptions: { ecmaVersion: 'latest', sourceType: 'module' },
  rules: { 'no-console': process.env.NODE_ENV==='production'?'warn':'off','no-debugger':process.env.NODE_ENV==='production'?'warn':'off' }
};
EOF
# Create Prettier config
cat << EOF > .prettierrc
{
  "semi": true,
  "singleQuote": true,
  "tabWidth": 2,
  "trailingComma": "es5",
  "printWidth": 100,
  "bracketSpacing": true,
  "arrowParens": "avoid"
}
EOF
# Create base layout
cat << 'EOF' > src/_includes/layouts/base.njk
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{ title or site.title }}</title>
  <meta name="description" content="{{ description or site.description }}">
  <link rel="stylesheet" href="/css/style.css">
</head>
<body>
  <header>{% include "components/header.njk" %}</header>
  <main>{{ content | safe }}</main>
  <footer>{% include "components/footer.njk" %}</footer>
  <script src="/js/bundle.js"></script>
</body>
</html>
EOF
# Create header component
cat << 'EOF' > src/_includes/components/header.njk
<nav class="site-nav">
  <a href="/" class="site-logo">{{ site.name }}</a>
  <ul class="nav-list">
    <li><a href="/">Home</a></li>
    <li><a href="/about/">About</a></li>
    <li><a href="/contact/">Contact</a></li>
  </ul>
</nav>
EOF
# Create footer component
cat << 'EOF' > src/_includes/components/footer.njk
<div class="footer-content">
  <p>&copy; {{ site.currentYear }} {{ site.name }}. All rights reserved.</p>
</div>
EOF
# Create site data
cat << EOF > src/_data/site.json
{
  "name": "$PROJECT_NAME",
  "title": "$PROJECT_NAME - Welcome",
  "description": "A modern static site built with Eleventy",
  "url": "https://example.com",
  "currentYear": $(date +%Y)
}
EOF
# Create main CSS
cat << 'EOF' > src/assets/css/main.css
/* CSS Reset */
*,*::before,*::after { box-sizing: border-box; }
* { margin: 0; padding: 0; }
html { font-size: 100%; scroll-behavior: smooth; }
body { line-height: 1.5; -webkit-font-smoothing: antialiased; font-family: system-ui,-apple-system,sans-serif; }
img,picture,video,canvas,svg { display: block; max-width: 100%; }
input,button,textarea,select { font: inherit; }
p,h1,h2,h3,h4,h5,h6 { overflow-wrap: break-word; }
/* Custom Properties */
:root {
  --color-primary: #007bff;--color-secondary: #6c757d;--color-success: #28a745;
  --color-danger: #dc3545;--color-warning: #ffc107;--color-info: #17a2b8;
  --color-light: #f8f9fa;--color-dark: #343a40;
  --font-sans: system-ui,-apple-system,sans-serif;--font-mono: 'Courier New',monospace;
  --space-xs: 0.25rem;--space-sm: 0.5rem;--space-md: 1rem;--space-lg: 2rem;--space-xl: 4rem;
  --container-max: 1200px;
}
/* Layout */
.container { max-width: var(--container-max); margin: 0 auto; padding: 0 var(--space-md); }
/* Navigation */
.site-nav { background: var(--color-dark); color: var(--color-light); padding: var(--space-md); }
.nav-list { list-style: none; display: flex; gap: var(--space-lg); }
.nav-list a { color: var(--color-light); text-decoration: none; }
.nav-list a:hover { text-decoration: underline; }
/* Main Content */
main { min-height: 80vh; padding: var(--space-xl) 0; }
/* Footer */
footer { background: var(--color-dark); color: var(--color-light); padding: var(--space-lg); text-align: center; }
EOF
# Create main JS
cat << 'EOF' > src/assets/js/main.js
// Main JavaScript file
console.log('Site loaded!');
// Add your JavaScript here
EOF
# Create index page
cat << 'EOF' > src/index.njk
---
layout: layouts/base.njk
title: Home
eleventyNavigation:
  key: Home
  order: 1
---
<div class="container">
  <h1>Welcome to {{ site.name }}</h1>
  <p>This is your new Eleventy site. Start building something amazing!</p>
</div>
EOF
# Initial commit
git add .
git commit -m "Initial Eleventy project setup"
echo "✨ Project '$PROJECT_NAME' created successfully!"
echo "📁 Location: $(pwd)"
echo "Next steps:"
echo "  cd $PROJECT_NAME"
echo "  npm install"
echo "  npm run dev"
```
