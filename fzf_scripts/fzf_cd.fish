function cd_to_dir
    set -l selected_dir (fdfind -t d . "$argv[1]" | fzf +m --layout=reverse --height 50% --walker-skip .git,node_modules,target,.venv,.env,build,.cargo,.fzf,.rustup,.themes,.cache,.ruff_cache --preview 'tree -C {} -I "target" | head -200')
    if test -n "$selected_dir"
        # Change to the selected directory
        cd "$selected_dir" || return 1
    end
end
