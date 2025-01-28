#!/bin/bash

SESH="cw"

tmux new-session -d -s $SESH 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -d -s $SESH -n "code"
  tmux send-keys -t $SESH:notes "cd ~/dev/cw/chill-warrior/src/apps" C-m
  tmux send-keys -t $SHESH:notes "nvim ." C-m

  tmux new-window -d -s $SESH -n "run"
  tmux send-keys -t $SESH:shel "cd ~/dev/cw/chill-warrior/src/ChillWarrior.AppHost" C-m
  tmux send-keys -t $SESH:shel "dotnet run" C-m

  tmux select-window -t $SESH:code
fi

tmux attach-session -t $SESH

