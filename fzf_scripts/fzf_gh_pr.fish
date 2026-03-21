function fgp
    fzf --tmux 80%,100%,border-native --ansi \
        --info inline --reverse --header-lines 4 \
        --preview 'GH_FORCE_TTY=$FZF_PREVIEW_COLUMNS gh pr view --comments {1}' \
        --preview-window up:border-down \
        --with-shell 'bash -c' --style minimal \
        --bind 'start:preview(echo Loading pull requests ...)+reload:GH_FORCE_TTY=95% gh pr list --limit=1000' \
        --bind 'load:transform:(( FZF_TOTAL_COUNT )) || echo become:echo No pull requests' \
        --bind 'ctrl-o:execute-silent:gh pr view --web {1}' \
        --bind 'ctrl-v:execute:gh pr view {1} | sed "s/\r//g" | view - +"setf markdown"' \
        --bind 'enter:become:gh pr checkout {1}' \
        --footer 'Press Enter to checkout / CTRL-O to open in browser / CTRL-V to open in editor'
end
