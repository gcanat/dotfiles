#!/bin/bash

SCREENSHOTS_DIR=$(xdg-user-dir PICTURES)/screenshots
[[ ! -d "$SCREENSHOTS_DIR" ]] && mkdir -p "$SCREENSHOTS_DIR"

slurp | grim -g - "$SCREENSHOTS_DIR"/$(date +%F_%T).png
