#!/usr/bin/env bash

branch_name=${1:-"main"}
project_dir="$HOME/nerd"
session_name=$(tmux display-message -p "#S" 2>/dev/null)

if [[ -z $TMUX ]]; then
  echo "nerd type shit..."
  ~/.dotfiles/scripts/tmux-sessionizer "$project_dir"
  exit 0
fi

tmux rename-window -t "$session_name:zsh" "notes"
tmux send-keys -t "$session_name:notes" "cd ~/nerd" C-m
tmux send-keys -t "$session_name:notes" "clear" C-m
tmux send-keys -t "$session_name:notes" "nvim" C-m

# gneral window
~/.dotfiles/scripts/tmux-windowizer shel "cd '$project_dir' && clear"

# if branch name provided, switch to it in relevant windows
if [[ "$branch_name" != "main" ]]; then
  echo "switching to branch: $branch_name"
  tmux send-keys -t "$session_name:shel" "git checkout $branch_name || git checkout -b $branch_name" C-m
fi

tmux select-window -t "$session_name:shel"
