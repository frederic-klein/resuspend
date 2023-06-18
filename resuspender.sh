#!/bin/bash

echo "Going into suspend loop. If you want to stop looping and resume type y?"

while true; do
    pgrep i3lock || bash -c "i3lock -i /usr/share/backgrounds/ubuntu-default-greyscale-wallpaper.png -n" &
    # make sure i3lock had enough time to lock
    sleep 1 && sudo ./suspend.sh
    read -t 10 answer
    if [[ $answer == "y" ]]; then
        break
    fi
done
