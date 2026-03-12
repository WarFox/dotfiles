#!/bin/bash

# --- CONFIGURATION ---
PROJECTS_DIR="$HOME/Workspace/github.com/" # Change this to your repos folder
MAX_LOGS=3                                 # Number of recent commits to show

# --- ICONS ---
ICON_CLEAN="✅"
ICON_DIRTY="⚠️"
ICON_PENDING="⬆️"

# --- MAIN LOGIC ---
echo "Git" # Menu bar title
echo "---"

# Find all .git folders exactly 2 levels down (Project/Repo/.git)
# We use -maxdepth 3 to account for the .git folder itself
find "$PROJECTS_DIR" -maxdepth 3 -name ".git" -type d | while read -r gitdir; do
  # Get the actual repo path (parent of .git)
  REPO_PATH=$(dirname "$gitdir")

  # Get names for display: "Client / Repo"
  REPO_NAME=$(basename "$REPO_PATH")
  PARENT_NAME=$(basename "$(dirname "$REPO_PATH")")

  cd "$REPO_PATH" || continue

  # --- STATUS LOGIC ---
  STATUS_OUT=$(git status --porcelain)
  BEHIND=$(git rev-list HEAD..@{u} --count 2>/dev/null || echo 0)
  AHEAD=$(git rev-list @{u}..HEAD --count 2>/dev/null || echo 0)

  # Icon Selection
  ICON="✅"
  [[ -n "$STATUS_OUT" ]] && ICON="⚠️"
  [[ "$BEHIND" -gt 0 ]] && ICON="⬇️"
  [[ "$AHEAD" -gt 0 || "$BEHIND" -gt 0 ]] && CURRENT_ICON=$ICON_PENDING

  # Display Header: "Client / Repo"
  echo "$ICON $PARENT_NAME / $REPO_NAME | size=12 shell='open' param1='$REPO_PATH' terminal=false"

  # Show Status Details
  [[ -n "$STATUS_OUT" ]] && echo "-- Uncommitted changes | color=orange"
  [[ "$BEHIND" -gt 0 ]] && echo "-- $BEHIND commits behind origin | color=red"
  [[ "$AHEAD" -gt 0 ]] && echo "-- $AHEAD commits ahead of origin | color=blue"

  # Show Logs
  git log -n $MAX_LOGS --oneline --color=never | while read -r line; do
    echo "-- • $line | size=11"
  done

  # The Safe Sync Action (calling your safe script)
  echo "-- Safe Sync | bash='$HOME/Workspace/github.com/WarFox/dotfiles/swiftbar-plugins/safe_git_sync.sh' param1='$REPO_PATH' terminal=true refresh=true"
  echo "---"
done
