vim9script

if executable('ruff')
  # set formatprg
  # setlocal formatprg=black\ -q\ -l\ 120\ -
  # setlocal formatprg=black\ --fast\ -q\ -l\ 120\ 2>/dev/null\ --stdin-filename\ %\ -
  setl textwidth=120
  setl formatoptions=tcqjlron 
  setl formatprg=ruff\ format\ -n\ --stdin-filename\ %\ -
  # ensure we use formatprg isntead of formatexpr
  setl formatexpr=
endif
nnoremap <buffer> <leader>fi :%!isort -<CR>
b:undo_ftplugin ..= ' | setl foldignore< formatprg<'
b:undo_ftplugin ..= ' | exe "nunmap <buffer> <leader>fi"'

# small utilities to set/unset ipdb breakpoints
def SetBreakpoint()
  append('.', repeat(' ', strlen(matchstr(getline('.'), '^\s*'))) .. 'import ipdb; ipdb.set_trace()')
enddef

def RemoveBreakpoint()
  exe 'silent! g/^\s*import\sipdb\;\?\n*\s*ipdb.set_trace()/d'
enddef

def ToggleBreakpoint()
  if getline('.') =~# '^\s*import\sipdb'
    RemoveBreakpoint()
  else
    SetBreakpoint()
  endif
enddef
nnoremap <buffer> <F6> :call <SID>ToggleBreakpoint()<CR>
b:undo_ftplugin ..= ' | exe "nunmap <buffer> <F6>"'


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

# set the custom erroformat for pytest
var pytestefm = "%-G=%#\ ERRORS\ =%#,"
pytestefm ..= "%-G=%#\ FAILURES\ =%#,"
pytestefm ..= "%-G%\\s%\\*%\\d%\\+\ tests\ deselected%.%#,"
pytestefm ..= "%-GWARNING:\ Coverage\ disabled\ via\ --no-cov\ switch!"

# A line begining with ERROR: is a stand-alone error
pytestefm ..= "ERROR:\ %m,"

# Test FAILURES are multi-line and begin with something like
# ________________________ test_parse_file _____________________________________
pytestefm ..= "%E_%\\+\ %m\ _%\\+,"

# If continuing, match a file/line specifier
pytestefm ..= "%Cfile\ %f\\,\ line\ %l,"    # old style
pytestefm ..= "%C%f:%l:\ in\ %m,"           # new style

# A leading E followed by one or more spaces indicates a message
pytestefm ..= "%CE\ %#%m,"

# This looks like something you might find in a traceback
pytestefm ..= "%EE\ \ \ \ \ File\ \#%f\"\\,\ line\ %l,"
pytestefm ..= "%ZE\ \ \ %[%^\ ]%\\@=%m,"

# File/line markers at the end of a multi-line error from the `-tb="short` option
pytestefm ..= "%Z%f:%l:\ %m,"
pytestefm ..= "%Z%f:%l:,"

# Continues with "anything" if we
#  1. have already started a multiline (after matching an E)
#  2. haven"t finished (before matching a Z)
pytestefm ..= "%C%.%#,"

# Skip any line containing " seconds,"?
pytestefm ..= "%-G%.%#\ seconds,"

# Skip everything else
pytestefm ..= "%-G%.%#,"

# need to suppress warning to correctly parse pytest output
$PYTHONWARNINGS = "ignore"

def RunTest(filename: string)
  # exe ":set cpo-=C"
  var cmd = 'python3 -m pytest --tb=short -q ' .. expand(filename)
  setqflist([], ' ', {'title': $'{cmd}'})
  var qfid = getqflist({'id': 0}).id
  var lines = []
  var job = job_start( cmd, {
    err_cb: (_, line) => {
      echom line
    },
    out_cb: (_, line) => {
    if getqflist({'id': qfid}).id == qfid
      setqflist([], 'a', {'id': qfid, 'lines': [line], 'efm': pytestefm})
      lines->add(line)
    endif
    },
    exit_cb: (job, status) => {
      if status == 1
        exe 'copen'
      elseif status == 0
        echow $'[SUCCESS] All tests passed!'
      else
        echow $'[ERROR] Job failed with status {status}'
      endif
    }
  })
  if job_status(job) == 'failed'
    echom 'Job failed'
  endif
  enddef

nnoremap <buffer> <F2> <scriptcmd>RunTest('%')<CR>
b:undo_ftplugin ..= ' | exe "nunmap <buffer> <F2>"'
