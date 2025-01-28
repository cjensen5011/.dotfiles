#!/bin/bash

SESH="l5r"

tmux new-session -d -s $SESH 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -d -s $SESH -n "notes"
  tmux send-keys -t $SESH:notes "cd ~/nerd/l5r" C-m
  tmux send-keys -t $SHESH:notes "nvim ." C-m

  tmux new-window -d -s $SESH -n "shel"
  tmux send-keys -t $SESH:shel "cd ~/nerd/l5r" C-m

  tmux select-window -t $SESH:notes
fi

tmux attach-session -t $SESH
