#!/bin/sh
CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/foot/foot.ini"

if grep -q 'initial-color-theme=dark' "$CONFIG"; then
    sed -i 's/initial-color-theme=dark/initial-color-theme=light/' "$CONFIG"
    sig=USR2   # foot: switch running instances to the light theme
else
    sed -i 's/initial-color-theme=light/initial-color-theme=dark/' "$CONFIG"
    sig=USR1   # foot: switch running instances to the dark theme
fi

pkill -u "$USER" -"$sig" -x foot
