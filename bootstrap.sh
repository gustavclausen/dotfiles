#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")";

echo "👉 Pulling latest changes from repo..."
git pull origin main;

echo ""
echo "👉 Syncing files..."
rsync --exclude ".git/" \
	  --exclude ".DS_Store" \
	  --exclude ".osx" \
	  --exclude "bootstrap.sh" \
	  --exclude "README.md" \
	  --exclude ".pre-commit-config.yaml" \
	  -avh --no-perms . ~;

echo ""
echo "👉 Configuring git..."
git config --global core.excludesfile ~/.gitignore
git config --global init.templateDir ~/.git-template
git config --global push.default current
git config --global core.editor vim
git config --global alias.root "rev-parse --show-toplevel"

echo ""
echo "👉 Reloading changes..."
source ~/.zshrc;

echo ""
echo "Done! Enjoy 😉"
