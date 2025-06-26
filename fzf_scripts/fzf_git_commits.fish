function fgc
    set -l git_log "git log --graph --color --format=\"%C(white)%h - %C(green)%cs - %C(blue)%s%C(red)%d\""
    set -l git_log_all "git log --all --graph --color --format=\"%C(white)%h - %C(green)%cs - %C(blue)%s%C(red)%d\""

    set -l git_show "git show --color (echo {} | grep -o '[a-f0-9]\{7\}' | sed -n '1p')"
    set -l git_show_subshell "sh -c \"git show --color (echo {} | grep -o '[a-f0-9]\{7\}' | sed -n '1p') | less -R\""

    set -l git_checkout "git checkout (echo {} | grep -o '[a-f0-9]\{7\}' | sed -n '1p')"
    set -l git_reset "git reset (echo {} | grep -o '[a-f0-9]\{7\}' | sed -n '1p')"
    set -l git_rebase_interactive "git rebase --interactive (echo {} | grep -o '[a-f0-9]\{7\}' | sed -n '1p')"
    set -l git_cherry_pick "git cherry-pick (echo {} | grep -o '[a-f0-9]\{7\}' | sed -n '1p')"

    set -l header "> ENTER to display the diff with less"

    set -l header_branch "$header
> CTRL-S to switch to All Commits mode
> ALT-C to checkout the commit | ALT-R to reset to the commit
> ALT-I to rebase interactively until the commit"

    set -l header_all "$header
> CTRL-S to switch to Branch Commits mode
> ALT-P to cherry pick"

    set -l branch_prompt 'Branch > '
    set -l all_prompt 'All > '

    set -l mode_all "change-prompt($all_prompt)+reload($git_log_all)+change-header($header_all)+unbind(alt-c)+unbind(alt-r)+unbind(alt-i)+rebind(alt-p)"
    set -l mode_branch "change-prompt($branch_prompt)+reload($git_log)+change-header($header_branch)+rebind(alt-c)+rebind(alt-r)+rebind(alt-i)+unbind(alt-p)"

    eval "$git_log" | fzf \
        --ansi \
        --reverse \
        --no-sort \
        --prompt="$branch_prompt" \
        --header-first \
        --header="$header_branch" \
        --preview="$git_show" \
        --bind='start:unbind(alt-p)' \
        --bind="ctrl-s:transform:begin; if string match -q \"*$branch_prompt*\" \$FZF_PROMPT; echo '$mode_all'; else; echo '$mode_branch'; end; end" \
        --bind="enter:execute($git_show_subshell)" \
        --bind="alt-c:execute($git_checkout)+abort" \
        --bind="alt-r:execute($git_reset)+abort" \
        --bind="alt-i:execute($git_rebase_interactive)+abort" \
        --bind="alt-p:execute($git_cherry_pick)+abort" \
        --bind='f1:toggle-header' \
        --bind='f2:toggle-preview' \
        --bind='ctrl-y:preview-up' \
        --bind='ctrl-e:preview-down' \
        --bind='ctrl-u:preview-half-page-up' \
        --bind='ctrl-d:preview-half-page-down'
end
