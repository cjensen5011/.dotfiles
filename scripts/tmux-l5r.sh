#!/bin/bash

SESH="l5r"

tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -d -s $SESH -n "notes"
  tmux send-keys -t $SESH:notes "cd ~/nerd/l5r" C-m
  tmux send-keys -t $SESH:notes "clear" C-m
  tmux send-keys -t $SESH:notes "nvim ." C-m

  tmux new-window -t $SESH -n "shel"
  tmux send-keys -t $SESH:shel "cd ~/nerd/l5r" C-m
  tmux send-keys -t $SESH:shel "clear" C-m

  tmux select-window -t $SESH:notes
fi

tmux attach-session -t $SESH
