#!/bin/bash
args=()
tmpfiles=()

for out in $(swaymsg -t get_outputs | jq -r '.[] | select(.active) | .name'); do
    img=$(mktemp /tmp/XXXXXXXXXX.png)
    tmpfiles+=("$img")
    grim -s 0.05 -o "$out" -t png "$img"
    args+=(-i "$out:$img")
done

swaylock -s fill "${args[@]}"
rm -f "${tmpfiles[@]}"
