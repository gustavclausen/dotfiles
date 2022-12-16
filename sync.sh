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
FILE_PATHS=$(find "$DIR" -type f -not -path "$DIR/.git/*" -not -name "*.sh" -printf "%P ")
for FILE_PATH in $FILE_PATHS; do
    SOURCE="$HOME/$FILE_PATH"
    DIST="$DIR/$FILE_PATH"
    if test -f "$SOURCE"; then
        cp "$SOURCE" "$DIST"
    fi
done

echo ""
echo "Done! Remember to commit and push the changes 🙂"
