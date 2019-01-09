#!/bin/bash

tmux new -s work -d
tmux rename-window -t work takt-core 
tmux send-keys -t work 'cd ~/Development/github/takt-core' C-m
tmux split-window -h
tmux send-keys -t work 'cd ~/Development/github/takt-core' C-m

tmux new-window -t work
tmux rename-window -t work jump 
tmux split-window -v
tmux split-window -v

tmux new-window -t work
tmux rename-window -t work db 

tmux new-window -t work
tmux rename-window -t work takt-jobs 
tmux send-keys -t work 'cd ~/Development/github/takt-jobs' C-m

tmux new-window -t work
tmux rename-window -t work Downloads 
tmux send-keys -t work 'cd ~/Downloads' C-m

tmux new-window -t work
tmux rename-window -t work Documents 
tmux send-keys -t work 'cd ~/Documents' C-m
tmux attach -t work
