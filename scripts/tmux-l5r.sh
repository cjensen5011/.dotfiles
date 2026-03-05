#!/usr/bin/env bash

BRANCH_NAME=${1:-main}
ROOT_DIR="$HOME/dev/l5rsheet"
CODE_DIR="$HOME/dev/l5rsheet"
# API_DIR="$HOME/dev/cw/chill-warrior/src/Chillwarrior.AppHost"  # NOTE: kept as given; correct if typo
SESSIONIZER="$HOME/.dotfiles/scripts/tmux-sessionizer"
WINDOWIZER="$HOME/.dotfiles/scripts/tmux-windowizer"

if [[ ! -d "$CODE_DIR" ]]; then
  echo "WARNING: CODE_DIR does not exist: $CODE_DIR" >&2
fi

# if [[ ! -d "$API_DIR" ]]; then
#   echo "WARNING: API_DIR does not exist: $API_DIR" >&2
# fi

# If not inside tmux, create/switch session rooted at CODE_DIR first
if [[ -z $TMUX ]]; then
  "$SESSIONIZER" "$CODE_DIR"
fi

SESSION_NAME=$(tmux display-message -p '#S')

# Reuse existing first window (often 'zsh' or similar) -> rename to code
tmux rename-window -t "$SESSION_NAME:0" code 2>/dev/null || tmux rename-window -t "$SESSION_NAME:zsh" code 2>/dev/null
tmux send-keys -t "$SESSION_NAME:code" "cd '$CODE_DIR'" C-m \; send-keys -t "$SESSION_NAME:code" clear C-m \; send-keys -t "$SESSION_NAME:code" nvim C-m

 # Metro window
"$WINDOWIZER" metro "cd '$CODE_DIR' && clear && npx expo run:ios"

# API window
# "$WINDOWIZER" api "cd '$API_DIR' && clear && dotnet run"

# Shel window (general shell + optional branch checkout)
"$WINDOWIZER" shel "cd '$CODE_DIR' && clear"
if [[ "$BRANCH_NAME" != "main" ]]; then
  tmux send-keys -t "$SESSION_NAME:shel" "echo 'Switching to branch: $BRANCH_NAME'" C-m
  tmux send-keys -t "$SESSION_NAME:shel" "git fetch --all" C-m
  tmux send-keys -t "$SESSION_NAME:shel" "git checkout $BRANCH_NAME || git checkout -b $BRANCH_NAME" C-m
fi

# Focus code window when done
tmux select-window -t "$SESSION_NAME:code"

# If we started outside tmux (initial launch), emit a status line to stderr only (keeps code window clean)
if [[ -z $TMUX_PARENT ]]; then
  >&2 echo "dev session prepared (code | metro | shel)"
fi

