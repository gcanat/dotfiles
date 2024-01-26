vim9script
# cherry picked from https://github.com/habamax/.vim/blob/master/autoload/git.vim

import autoload 'popup.vim'

# Show commit that introduced current(selected) line
# If a count was given, show full history
# Src: https://www.reddit.com/r/vim/comments/i50pce/how_to_show_commit_that_introduced_current_line/
# Usage:
#   import autoload 'git.vim'
#   nnoremap <silent> <space>gi <scriptcmd>git.ShowCommit(v:count)<CR>
#   xnoremap <silent> <space>gi <scriptcmd>git.ShowCommit(v:count, line("v"), line("."))<CR>
export def ShowCommit(count: number, firstline: number = line("."), lastline: number = line("."))
    if !executable('git')
        echoerr "Git is not installed!"
        return
    endif

    var depth = (count > 0 ? "" : "-n 1")
    var git_output = systemlist(
                  "git -C " .. shellescape(fnamemodify(resolve(expand('%:p')), ":h")) ..
                  $" log --no-merges {depth} -L " ..
                  shellescape($'{firstline},{lastline}:{resolve(expand("%:p"))}')
              )

    popup.ShowAtCursor(git_output, (winid) => {
        setbufvar(winbufnr(winid), "&filetype", "git")
    })
enddef


# Blame current (selected) line.
# Usage:
#   import autoload 'git.vim'
#   nnoremap <silent> <space>gb <scriptcmd>git.Blame()<CR>
#   xnoremap <silent> <space>gb <scriptcmd>git.Blame(line("v"), line("."))<CR>
export def Blame(firstline: number = line("."), lastline: number = line("."))
    if !executable('git')
        echoerr "Git is not installed!"
        return
    endif

    var git_output = systemlist(
                  "git -C " .. shellescape(fnamemodify(resolve(expand('%:p')), ":h")) ..
                  $' blame -L {firstline},{lastline} {expand("%:t")}')

    popup.ShowAtCursor(git_output, (winid) => {
        setbufvar(winbufnr(winid), "&filetype", "fugitiveblame")
    })
enddef
