#!/usr/bin/env bash
extensions=(
  ms-vscode-remote.remote-wsl
  esbenp.prettier-vscode
  dbaeumer.vscode-eslint
  ritwickdey.LiveServer
  formulahendry.auto-rename-tag
  naumovs.color-highlight
  eamodio.gitlens
  donjayamanne.githistory
  ecmel.vscode-html-css
  zignd.html-css-class-completion
  pranaygp.vscode-css-peek
  ronnidc.nunjucks
  phoenisx.cssvar
  bchavez.vscode-eleventy
  xabikos.javascriptsnippets
  christian-kohler.path-intellisense
  wayou.vscode-todo-highlight
  gruntfuggly.todo-tree
  alefragnani.project-manager
  waderyan.rollupjs
  figma.figma-vscode-extension
  kisstkondoros.vscode-gutter-preview
  CoenraadS.bracket-pair-colorizer-2
)

for ext in "${extensions[@]}"; do
  code --install-extension "$ext"
done


