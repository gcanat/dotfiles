" Diff against a specificy commit hash or HEAD
function! Diff(spec)
  vertical new
  setlocal bufhidden=wipe buftype=nofile nobuflisted noswapfile
    let cmd = "++edit #"
  if len(a:spec)
    let cmd = "!git -C " . shellescape(fnamemodify(finddir('.git', '.;'), ':p:h:h')) . " show " . a:spec . ":#"
  endif
  execute "read " . cmd
  silent 0d_
  diffthis
  wincmd p
  diffthis
endfunction
command! -nargs=? Diff call Diff(<q-args>)

" Grep using grepprg
function! Grep(...)
  return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
  " return system(join([&grepprg] + [join(a:000, ' ')], ' '))
endfunction

command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)

cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'


func Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

" easy insert **/*. in command line
cnoreabbrev rù **/*.<c-r>=Eatchar('\m\s')<cr>

" try to use fd or rg to find files
set errorformat+=%f
if executable("fd")
  let g:findcmd = "fd \--type f"
elseif executable("fdfind")
  let g:findcmd = "fdfind \--type f"
elseif executable("rg")
  let g:findcmd = "rg --files"
else
  let g:findcmd = 'find . ! -path "./.*/**" ! -path "./target/**" ! -path "./bin/**" ! -path "./build/**" ! -path "./**/.*" ! -path "**__pycache__**" -type f'
endif

function! Find(pat, ...)
  let s:arg_list = [a:pat]
  if g:findcmd[0:3] == "find" 
    let s:arg_list = ["-name '*" . a:pat . "*'"]
  elseif g:findcmd[0:1] == "rg"
    let s:arg_list = ["-g '*" . a:pat . "*'"]
  endif
  if a:0 > 0
    s:arg_list += a:000
  endif
  return system(join([g:findcmd] + [join(s:arg_list, ' ')], ' '))
endfunction
command! -nargs=+ -complete=file_in_path -bar Find cgetexpr Find(<f-args>)
command! -nargs=+ -complete=file_in_path -bar Find cgetexpr Find(<f-args>)


function! Commit(...)
  let commitcmd = "git log --graph --pretty=format:'%h - %d %s (%cr) <%an>'"
  return system(commitcmd)
endfunction
command! -nargs=0 -bar Commit cgetexpr Commit()

" :GB to git blame current line :%GB to blame the whole file, :7,13GB blame range
command! -range GB echo join(systemlist("git -C " . shellescape(expand('%:p:h')) . " blame -L <line1>,<line2> " . expand('%:t')), "\n")

command! -bang -nargs=1 Global call setloclist(0, [], ' ',
  \ {'title': 'Global<bang> ' .. <q-args>,
  \  'efm':   '%f:%l:%c\ %m,%f:%l',
  \  'lines': execute('g<bang>/' .. <q-args> .. '/#')
  \           ->split('\n')
  \           ->map({_, val -> expand("%") .. ":" .. trim(val)->substitute('^\d\+','&:' .. trim(val)->substitute('^\d\+ ','','')->charidx(trim(val)->substitute('^\d\+','','')->match(<q-args>)),'')})
  \ })

" use git jump script if possible
if executable('git-jump')
  command! -bar -nargs=* Jump cexpr system('git jump --stdout ' . expand(<q-args>)) | cope
endif

" " interactive file search using ripgrep + fzf
" function! FZF() abort
"     let l:tempname = tempname()
"     execute 'silent !rg --files . | fzf -m --border --height=20' . '| awk ''{ print $1":1:0" }'' > ' . fnameescape(l:tempname)
"     try
"         execute 'cfile ' . l:tempname
"         redraw!
"     finally
"         call delete(l:tempname)
"     endtry
" endfunction

" " :Files
" command! -nargs=* Files call FZF()
" nnoremap <space>f :Files<cr>

" " interactive grep file content using ripgrep + fzf
" function! RG(args) abort
"     let l:tempname = tempname()
"     let l:pattern = '.'
"     if len(a:args) > 0
"         let l:pattern = a:args
"     endif
"     " rg --vimgrep <pattern> | fzf -m > file
"     execute 'silent !rg --no-heading --line-number --column --smart-case ''' .  l:pattern . ''' | fzf -m --border --delimiter : --nth 3.. > ' . fnameescape(l:tempname)
"     try
"         execute 'cfile ' . l:tempname
"         redraw!
"     finally
"         call delete(l:tempname)
"     endtry
" endfunction

" " :Rg [pattern]
" command! -nargs=* Rg call RG(<q-args>)

" " <space>/
" nnoremap <space>/ :Rg<cr>

function! CurrentGitStatus()
    let gitoutput = systemlist('cd '.expand('%:p:h:S').' 2>/dev/null'.' && git status -s 2>/dev/null')
    let gitbranch = system('cd '.expand('%:p:h:S').' 2>/dev/null'.' && git branch --show-current 2>/dev/null | tr -d "\n"')
    if len(gitbranch) > 0
        let g:gitstatus = '.' . gitbranch .'/'. strpart(get(gitoutput, 0, ' '), 0, 2)
    else
        let g:gitstatus = ''
    endif
endfunc
autocmd BufEnter,BufWritePost * call CurrentGitStatus()


let g:currentmode = { 'n': 'NORMAL', 'no': 'N·OP·PEND', 'v': 'VISUAL', 'V': 'V·LINE', '': 'V·BLOCK', 's': 'SELECT', 'S': 'S·LINE', '': 'S·BLOCK', 'i': 'INSERT', 'R': 'REPLACE', 'Rv': 'V·REPLACE', 'c': 'COMMAND', 'cv': 'VIM EX', 'ce': 'EX', 'r': 'PROMPT', 'rm': 'MORE', 'r?': 'CONFIRM', '!': 'SHELL', 't': 'TERMINAL'}
let g:modegroups = { 'n': 'NRM', 'no': 'NRM', 'v': 'VIS', 'V': 'VIS', '': 'VIS', '': 'VIS', 's': 'OTH', 'S': 'OTH', 'i': 'INS', 'R': 'INS', 'Rv': 'INS', 'c': 'OTH', 'cv': 'OTH', 'ce': 'OTH', 'r': 'OTH', 'rm': 'OTH', 'r?': 'OTH', '!': 'OTH', 't': 'OTH'}

function! Modetheme(group)
  if g:modegroups[mode()]==a:group
    let g:colthm = g:currentmode[mode()]
    let g:lineModes = g:colthm
    return "  ".g:lineModes." "
  else
    return ''
  endif
endfunction

set statusline=
set statusline+=%#CursorColumn#%{(Modetheme('NRM'))}
set statusline+=%#DiffChange#%{(Modetheme('VIS'))}
set statusline+=%#DiffAdd#%{(Modetheme('INS'))}
set statusline+=%#ToolbarButton#%{(Modetheme('OTH'))}
set statusline+=%#StatusLine#
set statusline+=%#PmenuSel#
" set statusline+=%{StatuslineGit()}
" set statusline+=%{FugitiveStatusline()}
set statusline+=%{g:gitstatus}
set statusline+=%#StatusLine#
set statusline+=\ %f
set statusline+=\ %m\ 
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}\ 
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

function! SetWildignore() abort
  let l:cmd = 'git check-ignore *'
  let l:files = systemlist(l:cmd)
  if v:shell_error == 0
    let l:ignored = join(l:files, ',')
    execute 'setlocal wildignore+=' . l:ignored
  endif
endfunction

augroup gitignore
  autocmd!
  autocmd! BufReadPost * call SetWildignore()
augroup END

autocmd BufReadPost,BufNewFile *
  \ if executable('git') |
  \   let s:root_dir = system('git rev-parse --show-toplevel') |
  \   if s:root_dir[0:5] != 'fatal:' |
  \     let &l:path = join(systemlist('git ls-tree -d --name-only -r HEAD'), ',') |
  \   endif |
  \ endif

" search wiki notes
" function! s:notes_completion(A, L, P) abort
"   return readdir(expand('~/wiki'))->map('expand("~/wiki/")..v:val')->filter('v:val =~ a:A')
" endfunction
" command! -nargs=1 -complete=customlist,s:notes_completion Notes :edit <args>
