#!/bin/bash

SESH="cw"

tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then
  # window 1
  tmux new-session -d -s $SESH -n "code"
  tmux send-keys -t $SESH:code "cd ~/dev/cw/chill-warrior/src/apps" C-m
  tmux send-keys -t $SESH:code "clear" C-m
  tmux send-keys -t $SESH:code "nvim ." C-m

  # window 2
  tmux new-window -t $SESH -n "run"
  tmux send-keys -t $SESH:run "cd ~/dev/cw/chill-warrior/src/ChillWarrior.AppHost" C-m
  tmux send-keys -t $SESH:run "clear" C-m
  tmux send-keys -t $SESH:run "dotnet run" C-m

  # window 3
  tmux new-window -t $SESH -n "shel"
  tmux send-keys -t $SESH:shel "cd ~/dev/cw/chill-warrior/src/apps" C-m
  tmux send-keys -t $SESH:shel "clear" C-m

  # focus window 1
  tmux select-window -t $SESH:code
fi

tmux attach-session -t $SESH
