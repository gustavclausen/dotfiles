#!/usr/bin/env bash

# Resolve absolute path for current script
SOURCE="${BASH_SOURCE[0]}"
while [[ -L "$SOURCE" ]]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"

cd "$DIR" || exit 1

echo "👉 Pulling latest changes from repo..."
git pull origin main

echo ""
echo "👉 Syncing files..."
rsync -avh --exclude-from="$DIR/exclude.list" --no-perms . ~

echo ""
echo "👉 Configuring git..."
git config --global core.excludesfile ~/.gitignore
git config --global push.default current
git config --global core.editor nvim
git config --global alias.root "rev-parse --show-toplevel"

echo ""
echo "👉 Download Homebrew dependencies..."
brew bundle install --global

echo ""
echo "👉 Reloading changes..."
# shellcheck disable=SC1090
source ~/.zshrc

echo ""
echo "Done! Enjoy 😉"
