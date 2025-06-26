#!/usr/bin/env fish

function fgb
    set -l git_branches "git branch --all --color --format='%(HEAD) %(color:yellow)%(refname:short):%(color:green)%(committerdate:short):%(color:blue)%(subject)' | column --table --separator=':'"
    set -l get_selected_branch 'echo {} | sed "s/^[* ]*//" | awk "{print \$1}"'
    set -l git_log "git log \$($get_selected_branch) --graph --color --format='%C(white)%h - %C(green)%cs - %C(blue)%s%C(red)%d'"
    set -l git_diff "git diff --color (git branch --show-current)..($get_selected_branch)"
    set -l git_show_subshell "test -n \"\$($get_selected_branch)\" && sh -c \"git show --color \$($get_selected_branch) | less -R\""
    set -l header "> ALT-M to merge with current * branch | ALT-R to rebase with current * branch
> ALT-C to checkout the branch
> ALT-D to delete the merged local branch | ALT-X to force delete the local branch
> ENTER to open the diff with less"

    eval $git_branches | fzf \
        --ansi \
        --reverse \
        --no-sort \
        --preview-label '[ Commits ]' \
        --preview "$git_log" \
        --header-first \
        --header="$header" \
        --bind="alt-c:execute(git checkout \$($get_selected_branch))" \
        --bind="alt-c:+reload($git_branches)" \
        --bind="alt-m:execute(git merge \$($get_selected_branch))" \
        --bind="alt-r:execute(git rebase \$($get_selected_branch))" \
        --bind="alt-d:execute(git branch --delete \$($get_selected_branch))" \
        --bind="alt-d:+reload($git_branches)" \
        --bind="alt-x:execute(git branch --delete --force \$($get_selected_branch))" \
        --bind="alt-x:+reload($git_branches)" \
        --bind="enter:execute($git_show_subshell)" \
        --bind='ctrl-f:change-preview-label([ Diff ])' \
        --bind="ctrl-f:+change-preview($git_diff)" \
        --bind='ctrl-i:change-preview-label([ Commits ])' \
        --bind="ctrl-i:+change-preview($git_log)" \
        --bind='f1:toggle-header' \
        --bind='f2:toggle-preview' \
        --bind='ctrl-y:preview-up' \
        --bind='ctrl-e:preview-down' \
        --bind='ctrl-u:preview-half-page-up' \
        --bind='ctrl-d:preview-half-page-down'
end
