#!/bin/bash
REPO_PATH="$1"
cd "$REPO_PATH" || exit

# 1. Save current state
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
HAS_CHANGES=$(git status --porcelain)

echo "🔄 Syncing $REPO_PATH..."

# 2. Stash if dirty
STASHED=false
if [ -n "$HAS_CHANGES" ]; then
  echo "📦 Stashing uncommitted changes..."
  git stash push -m "SwiftBar Auto-Stash"
  STASHED=true
fi

# 3. Switch to main/master and pull
# (Determines if main or master exists)
MAIN_BRANCH=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
[[ -z "$MAIN_BRANCH" ]] && MAIN_BRANCH="main"

echo "🌿 Switching to $MAIN_BRANCH and pulling..."
git checkout "$MAIN_BRANCH"
git pull origin "$MAIN_BRANCH"

# 4. Return to original branch
if [ "$CURRENT_BRANCH" != "$MAIN_BRANCH" ]; then
  echo "🔙 Returning to $CURRENT_BRANCH..."
  git checkout "$CURRENT_BRANCH"
  # Optional: Merge main into your working branch
  # git merge "$MAIN_BRANCH"
fi

# 5. Restore changes
if [ "$STASHED" = true ]; then
  echo "🔓 Restoring stashed changes..."
  git stash pop
fi

echo "✅ Done!"
