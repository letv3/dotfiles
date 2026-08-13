#!/usr/bin/env bash
# Claude Code status line — mirrors Powerlevel10k classic prompt style

input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
model=$(echo "$input" | jq -r '.model.display_name // ""')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
git_worktree=$(echo "$input" | jq -r '.workspace.git_worktree // empty')

# Shorten home directory to ~
home="$HOME"
short_cwd="${cwd/#$home/\~}"

# Git branch (skip optional lock to avoid contention)
git_branch=""
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
  git_branch=$(git -C "$cwd" -c core.fsmonitor=false symbolic-ref --short HEAD 2>/dev/null \
    || git -C "$cwd" -c core.fsmonitor=false rev-parse --short HEAD 2>/dev/null)
fi

# Context usage indicator
ctx_part=""
if [ -n "$used" ]; then
  ctx_part=" | ctx:$(printf '%.0f' "$used")%"
fi

# Worktree indicator
wt_part=""
if [ -n "$git_worktree" ]; then
  wt_part=" [wt:$git_worktree]"
fi

# Assemble the line
if [ -n "$git_branch" ]; then
  printf "\033[34m%s\033[0m \033[32m(%s)\033[0m%s | \033[36m%s\033[0m%s" \
    "$short_cwd" "$git_branch" "$wt_part" "$model" "$ctx_part"
else
  printf "\033[34m%s\033[0m%s | \033[36m%s\033[0m%s" \
    "$short_cwd" "$wt_part" "$model" "$ctx_part"
fi
