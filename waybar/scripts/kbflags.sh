#!/usr/bin/env bash

# store command results to flag
flag=$(fcitx5-remote -n)

case "$flag" in
    "keyboard-us")
        echo "🇺🇸"
        ;;
    "mozc")
        echo "🇯🇵"
        ;;
    "keyboard-ru-phonetic")
        echo "🇷🇺"
        ;;
    *)
        echo "..."
        ;;
esac
