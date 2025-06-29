#!/usr/bin/env bash
set -euo pipefail

if [ -z "${1:-}" ]; then
  echo "Usage: create-eleventy-site.sh <directory> [Site Name] [#BrandColor] [domain.com]"
  exit 1
fi

TARGET_DIR="$1"
SITE_NAME="${2:-My Site}"
BRAND_COLOR="${3:-#ff6a3e}"
DOMAIN="${4:-example.com}"

echo "▶ Generating $SITE_NAME at $TARGET_DIR …"
npx degit SteveJettMedia/eleventy-starter "$TARGET_DIR"
cd "$TARGET_DIR"
./scripts/bootstrap.sh "$SITE_NAME" "$BRAND_COLOR" "$DOMAIN"
npm install

echo "✅ All set!  cd $TARGET_DIR && npm run dev"
