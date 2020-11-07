#!/bin/bash


main ()
{
    tmux new-session -d
    sleep 0.1
    tmux send 'ls -l' ENTER;
    tmux splitw -v
    sleep 0.1
    tmux send 'date' ENTER;
    # attach
    tmux a
    (set -x; tmux ls)
}



setup() {
    clear
    echo Screen size: $(tput cols)x$(tput lines)
    echo "resize terminal..."
    printf '\e[8;60;80t'
    sleep 0.2
    echo Screen size: $(tput cols)x$(tput lines)
    
    echo "Show any running tmux sessions"
    (set -x; tmux ls)
    
    echo "To kill all unwanted tmux sessions:- tmux kill-server"
    echo "To detach from tmux session ^B d"
    
    read -p "Press RETURN to continue or CTRL/C to cancel"
}


setup
main

