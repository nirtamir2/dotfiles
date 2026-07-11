#!/usr/bin/env bash

set -e

# Where is the main worktree? (first one in the list is usually the primary)
MAIN_WORKTREE=$(git worktree list --porcelain | grep '^worktree ' | head -n1 | awk '{print $2}')

CURRENT_DIR=$(pwd)

if [ "$MAIN_WORKTREE" = "$CURRENT_DIR" ]; then
  echo "You're already in the main worktree."
  exit 0
fi

echo "Main worktree: $MAIN_WORKTREE"
echo "Current worktree: $CURRENT_DIR"
echo ""

# Copy all env-like files
for file in "$MAIN_WORKTREE"/.env*; do
  if [ -f "$file" ]; then
    echo "Copying $(basename "$file")"
    cp "$file" "$CURRENT_DIR/"
  fi
done

echo ""
echo "Done."