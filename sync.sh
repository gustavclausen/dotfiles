#!/usr/bin/env bash

set -e

# Resolve absolute path for current script
SOURCE="${BASH_SOURCE[0]}"
while [[ -L "$SOURCE" ]]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"

# Sync Homebrew dependencies
echo "👉 Syncing Homebrew dependencies..."
(cd "$HOME" && brew bundle dump --force --global)

echo ""
echo "👉 Syncing files back to repo..."

find "$DIR" -type f -printf "%P\n" | rsync -avh --exclude-from="$DIR/exclude.list" --files-from=- --ignore-missing-args ~ .
find "$DIR" -mindepth 2 -type d -printf "%P\n" | rsync -avhr --exclude-from="$DIR/exclude.list" --files-from=- --ignore-missing-args ~ .

echo ""
echo "Done! Remember to commit and push the changes 🙂"
