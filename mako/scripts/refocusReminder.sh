#!/bin/bash

while true; do
    HOUR=$(date +%H)
    HOUR=$((10#$HOUR))

    if [ "$HOUR" -eq 8 ] || [ "$HOUR" -eq 13 ] || [ "$HOUR" -eq 15 ] || [ "$HOUR" -eq 19 ]; then
        notify-send "Are you inventing things to do to avoid the important?"
    fi

    notify-send "$(shuf /home/saveon/.config/quotes.txt -n 1)"


    sleep 1h
done
