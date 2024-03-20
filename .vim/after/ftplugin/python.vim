vim9script

if executable('black')
  # set formatprg
  # setlocal formatprg=black\ -q\ -l\ 120\ -
  setlocal formatprg=black\ --fast\ -q\ -l\ 120\ 2>/dev/null\ --stdin-filename\ %\ -
  setl textwidth=120
  setl formatoptions=tcqjlron 
  # setl formatprg=ruff\ format\ -n\ --stdin-filename\ %\ -
  # ensure we use formatprg isntead of formatexpr
  setl formatexpr=
endif
b:undo_ftplugin ..= ' | setl foldignore< formatprg<'

import autoload 'popup.vim'

def Things()
    # var things = []
    var things = matchbufline(bufnr(),
        '\v(^\s*(def|class)\s+\k+.*$)|(if __name__ \=\= .*)',
        1, '$')->foreach((_, v) => {
            v.text = $"{v.text} ({v.lnum})"
        })
    popup.FilterMenu("Py Things", things,
        (res, key) => {
            exe $":{res.lnum}"
            normal! zz
        },
        (winid) => {
            win_execute(winid, "syn match FilterMenuLineNr '(\\d\\+)$'")
            win_execute(winid, "syn match FilterMenuFuncName '\\k\\+\\ze('")
            hi def link FilterMenuLineNr Comment
            hi def link FilterMenuFuncName Function
        })
enddef
nnoremap <buffer> <space>z <scriptcmd>Things()<CR>
b:undo_ftplugin ..= ' | exe "nunmap <buffer> <space>z"'
