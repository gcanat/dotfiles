function fgf
    set -l prompt_add "Add > "
    set -l prompt_reset "Reset > "

    set -l git_root_dir (git rev-parse --show-toplevel)
    set -l git_unstaged_files "git ls-files --modified --deleted --other --exclude-standard --deduplicate $git_root_dir"

    set -l git_staged_files 'git status --short | grep "^[A-Z]" | awk "{print \$NF}"'

    set -l git_reset "git reset -- {+}"
    set -l enter_cmd "($git_unstaged_files | grep {} && git add {+}) || $git_reset"

    set -l preview_status_label "[ Status ]"
    set -l preview_status "git status --short"

    set -l header "> CTRL-S to switch between Add Mode and Reset mode
> CTRL_T for status preview | CTRL-F for diff preview | CTRL-B for blame preview
> ALT-E to open files in your editor
> ALT-C to commit | ALT-A to append to the last commit"

    set -l add_header "$header
> ENTER to add files
> ALT-P to add patch"

    set -l reset_header "$header
> ENTER to reset files
> ALT-D to reset and checkout files"

    set -l mode_reset "change-prompt($prompt_reset)+reload($git_staged_files)+change-header($reset_header)+unbind(alt-p)+rebind(alt-d)"
    set -l mode_add "change-prompt($prompt_add)+reload($git_unstaged_files)+change-header($add_header)+rebind(alt-p)+unbind(alt-d)"

    eval "$git_unstaged_files" | fzf \
    --multi \
    --reverse \
    --no-sort \
    --prompt="Add > " \
    --preview-label="$preview_status_label" \
    --preview="$preview_status" \
    --header "$add_header" \
    --header-first \
    --bind='start:unbind(alt-d)' \
    --bind="ctrl-t:change-preview-label($preview_status_label)" \
    --bind="ctrl-t:+change-preview($preview_status)" \
    --bind='ctrl-f:change-preview-label([ Diff ])' \
    --bind='ctrl-f:+change-preview(git diff --color=always {} | sed "1,4d")' \
    --bind='ctrl-b:change-preview-label([ Blame ])' \
    --bind='ctrl-b:+change-preview(git blame --color-by-age {})' \
    --bind="ctrl-s:transform:begin; if string match -q \"*$prompt_add*\" \$FZF_PROMPT; echo '$mode_reset'; else; echo '$mode_add'; end; end" \
    --bind="enter:execute($enter_cmd)" \
    --bind="enter:+reload(begin; if string match -q \"*$prompt_add*\" \$FZF_PROMPT; eval $git_unstaged_files; else; eval $git_staged_files; end; end)" \
    --bind="enter:+refresh-preview" \
    --bind='alt-p:execute(git add --patch {+})' \
    --bind="alt-p:+reload($git_unstaged_files)" \
    --bind="alt-d:execute($git_reset && git checkout {+})" \
    --bind="alt-d:+reload($git_staged_files)" \
    --bind='alt-c:execute(git commit)+abort' \
    --bind='alt-a:execute(git commit --amend)+abort' \
    --bind='alt-e:execute(${EDITOR:-vim} {+})' \
    --bind='f1:toggle-header' \
    --bind='f2:toggle-preview' \
    --bind='ctrl-y:preview-up' \
    --bind='ctrl-e:preview-down' \
    --bind='ctrl-u:preview-half-page-up' \
    --bind='ctrl-d:preview-half-page-down'
end
