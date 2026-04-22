#!/bin/bash

primaryFiles=(
    "$HOME/.bashrc"
    "$HOME/.config/environment.d"
    "$HOME/.config/systemd"
    "$HOME/.config/hypr"
    "$HOME/.config/kitty"
    "$HOME/.config/mako"
    "$HOME/.config/nvim"
    "$HOME/.config/quotes.txt"
    "$HOME/.config/waybar"
)

dotFiles=(
    ".bashrc"
    "4environment.d"
    "4systemd"
    "hypr"
    "kitty"
    "mako"
    "nvim"
    "quotes.txt"
    "waybar"
)

echo "updating config..."

for i in "${!primaryFiles[@]}"; do
    src="${primaryFiles[$i]}"
    sink="$HOME/chickenScratch/dotfiles/${dotFiles[$i]}"

    if [ -d "$src" ]; then
        result=$(diff -qr "$src" "$sink" 2>/dev/null)
    else
        result=$(diff "$src" "$sink" 2>/dev/null)
    fi

    if [ ! -e "$sink" ] || [ -n "$result" ]; then
        echo "${dotFiles[$i]}: updating..."
        rm -rf "$sink"
        cp -r "$src" "$sink"
    else 
        echo "${dotFiles[$i]}: is up to date"
    fi
done

cd "$HOME/chickenScratch/dotfiles"
git add -A && git commit -m "config updated" && git push

echo "config updated"
