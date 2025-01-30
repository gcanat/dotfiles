#!/usr/bin/env bash

cd_to_dir() {
    local selected_dir
    selected_dir=$(fdfind -t d . "$1" | fzf +m --layout=reverse --height 50% --walker-skip .git,node_modules,target,.venv,.env,build,.cargo,.fzf,.rustup,.themes,.cache,.ruff_cache --preview 'tree -C {} -I "target" | head -200')
    if [[ -n "$selected_dir" ]]; then
        # Change to the selected directory
        cd "$selected_dir" || return 1
    fi
}

alias z='cd_to_dir ~/'
alias zi='cd_to_dir'
