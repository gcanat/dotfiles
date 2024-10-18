if &compatible
  set nocompatible
endif
syntax on
set autoindent
set signcolumn=yes
set nu relativenumber
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set encoding=utf-8
set laststatus=2
set hidden
set wildmenu wildignorecase
set incsearch ignorecase smartcase
set updatetime=100
if has('termguicolors') && (has('mac') || has('win32'))
  set termguicolors
endif
set background=dark

func! SetPath()
  let path_list = systemlist('find . -maxdepth 1 ! -path "./.*" ! -path "./target" ! -path "./bin" ! -path "./build" ! -path "./*.egg-info" ! -path "__pycache__" -type d')
  let paths = map(path_list, {_, val -> val != "." ? val[2:] . "/**" : val})
  return join(paths, ",")
endfunc
execute "set path=,," . SetPath()

set wildignore+=*.egg-info/**,.*,**/__pycache__/**,*.o,*.obj,*.bak,*.exe,*.swp,*.zwc,tags
if has("patch-8.2.4325")
  set wildoptions+=pum,fuzzy
endif
set fillchars=vert:│
set shortmess+=Tas
set undofile
set completeopt=menuone,preview
set wildcharm=<C-Z>
let &t_ut=''
let mapleader = ","
set backspace=indent,eol,start

" netrw
let g:netrw_banner=0 
let g:netrw_browse_split=4
let g:netrw_altv=1 
let g:netrw_liststyle=3
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+,.*\.swp$,.*\.un~$'

filetype plugin on
filetype indent on

if filereadable( expand("$VIMRUNTIME/colors/retrobox.vim") )
  colorscheme retrobox
endif

hi Normal guifg=NONE guibg=NONE

" easier on azerty keyboard
nmap à ]
nmap ç [
nmap ù }
nmap é {
vmap ù }
vmap é {
nnoremap <leader>b :b <C-Z>
nnoremap <leader>ft :Lex <bar> vert resize 25<CR>
nnoremap <leader>fe :fin **
nnoremap <leader>fm :bro ol<CR>
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
nnoremap <leader>gw :Grep <C-R><C-W><CR>

if executable('rg')
  set grepprg=rg\ --vimgrep
else
  set grepprg=grep\ --color=never\ -REHIns\ --exclude-dir=.git\ --exclude-dir=target\ --exclude-dir=build\ --exclude=*.swp\ --exclude=*.zwc\ --exclude=*.ipynb
endif

" Grep using grepprg
function! Grep(...)
  if exists('*expandcmd')
    return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
  else
    return system(join([&grepprg] + [join(a:000, ' ')], ' '))
  endif
endfunction

command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)

" Automatically open quickfix window
augroup quickfix
  autocmd!
  autocmd FileType qf wincmd J
  autocmd QuickFixCmdPost cgetexpr cwindow
  autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

" Function to grep the opened buffers
function! GrepallBuf(...)
  let s:buffers = map(getbufinfo({'buflisted': 1}), 'v:val.name')
  return system(join([&grepprg] + ['"' . expandcmd(join(a:000, ' ')) . '"'] + s:buffers, ' '))
endfunc

command! -nargs=1 Gbuf cgetexpr GrepallBuf(<f-args>)

" try to use fd to find files
set errorformat+=%f
if executable("fd")
  let g:findcmd = "fd \--type f"
elseif executable("fdfind")
  let g:findcmd = "fdfind \--type f"
else
  let g:findcmd = 'find . ! -path "./.git/**" ! -path "./target/**" ! -path "./bin/**" ! -path "./build/**" -type f'
endif

function! Find(pat, ...)
  let s:arg_list = g:findcmd[0:3] != "find" ? [a:pat] : ["-name *" . a:pat . "*"]
  if a:0 > 0
    s:arg_list += a:000
  endif
  if exists('*expandcmd')
    return system(join([g:findcmd] + [expandcmd(join(s:arg_list, ' '))], ' '))
  else
    return system(join([g:findcmd] + [join(s:arg_list, ' ')], ' '))
  endif
endfunction
command! -nargs=+ -complete=file_in_path -bar Find cgetexpr Find(<f-args>)

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

function! CurrentGitStatus()
  let gitoutput = systemlist('cd '.expand('%:p:h:S').' 2>/dev/null'.' && git status -s 2>/dev/null')
  let gitbranch = system('cd '.expand('%:p:h:S').' 2>/dev/null'.' && git branch --show-current 2>/dev/null | tr -d "\n"')
  if len(gitbranch) > 0
    let b:gitstatus = gitbranch .'/'. strpart(get(gitoutput, 0, ' '), 0, 2)
  else
    let b:gitstatus = ''
  endif
endfunc

autocmd BufEnter,BufWritePost * call CurrentGitStatus()
 
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{b:gitstatus}
set statusline+=%#StatusLine#
set statusline+=\ %f
set statusline+=%m\ 
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

function! Glog(...)
  let commitcmd = "git log -300 --graph --pretty=format:'%h - %d %s (%cr) <%an>'"
  return system(commitcmd)
endfunction
command! -nargs=0 -bar GcLog cgetexpr Glog()

" diff current file against HEAD
nnoremap <leader>gf :new gitlog <bar> setl ft=diff <bar> r !git diff #<CR>1Gdd
" Open window with git status info
nnoremap <leader>gs :new gitstatus <bar> setl ft=git nobuflisted noswapfile <bar> r !git status --porcelain<CR>1Gdd
" show the diff for the commit SHA under the cursor
nnoremap <leader>gc yiw<C-W>w:e! gitlog <bar> setl ft=git nobuflisted noswapfile <bar> r !git show <C-R>"<CR>1Gdd
" assuming qflist is popuplated with list of files modified by a PR, diff
" against master
nnoremap ]r :cn<CR>:Diff master<CR>
nnoremap [r :cp<CR>:Diff master<CR>

function! GitAdd(...)
  let addcmd = "git add " . shellescape(expand('<cfile>'))
  silent let f = system(addcmd)
  execute "1,$d | r !git status --porcelain"
endfunction
command! -nargs=0 -bar GitAdd call GitAdd()

function! GitReset(...)
  let addcmd = "git reset HEAD " . shellescape(expand('<cfile>'))
  silent let f = system(addcmd)
  execute "1,$d | r !git status --porcelain"
endfunction
command! -nargs=0 -bar GitReset call GitReset()

" add mappings similar to fugitive
augroup Gitbuffer
  autocmd!
  au WinLeave gitstatus unmap s
  au WinLeave gitstatus unmap S
  au WinLeave gitstatus unmap =
  au WinLeave gitstatus unmap cc
  au WinLeave gitstatus unmap ce
  au WinLeave gitstatus unmap gq
  au WinLeave gitstatus unmap <leader>r
  au VimEnter,WinEnter,BufWinEnter gitstatus nnoremap s :GitAdd<CR>1Gdd
  au VimEnter,WinEnter,BufWinEnter gitstatus nnoremap S :GitReset<CR>1Gdd
  au VimEnter,WinEnter,BufWinEnter gitstatus nnoremap = $:r !git diff <cfile><CR>g;k2e
  au VimEnter,WinEnter,BufWinEnter gitstatus nnoremap cc :!git commit -m ""<Left>
  au VimEnter,WinEnter,BufWinEnter gitstatus nnoremap ce :!git commit --amend --no-edit<CR>
  au VimEnter,WinEnter,BufWinEnter gitstatus nnoremap <leader>r :1,$d <bar> r !git status --porcelain<CR>
  au VimEnter,WinEnter,BufWinEnter gitstatus,gitlog nnoremap gq :bd!<CR>
augroup end

augroup CursColLine
  autocmd!
  au WinLeave * setlocal nocursorline nocursorcolumn
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
augroup end

let s:git_status_dictionary = {
  \ "A": "Added",
  \ "B": "Broken",
  \ "C": "Copied",
  \ "D": "Deleted",
  \ "M": "Modified",
  \ "R": "Renamed",
  \ "T": "Changed",
  \ "U": "Unmerged",
  \ "X": "Unknown"
  \ }
function! s:get_diff_files(rev)
  let gitroot = system('git rev-parse --show-toplevel')[:-2]
  let list = map(split(system(
    \ 'git diff --name-status '.a:rev), '\n'),
    \ '{"filename":"' . fnameescape(gitroot) 
    \ . '/" . matchstr(v:val, "\\S\\+$"),"text":s:git_status_dictionary[matchstr(v:val, "^\\w")]}'
    \ )
  call setqflist(list)
  copen
endfunction

" populate qflist with files changed in a branch compared to commit or branch
" given as arg
command! -nargs=1 DiffRev call s:get_diff_files(<q-args>)

" try to use comment builtin plugin
if has("patch-9.1.374")
  packadd comment
endif

function! DiffSign()
  call sign_define('DiffSignChange', {'text': '~', 'texthl': 'DiffChange'})
  call sign_define('DiffSignAdd', {'text': '+', 'texthl': 'DiffAdd'})
  call sign_define('DiffSignDel', {'text': '-', 'texthl': 'DiffDelete'})

  if &buftype == ''
    \&& system('git -C ' . expand("%:p:h") . ' rev-parse --is-inside-work-tree') == "true\n"
    \&& strlen(system('git -C ' . expand("%:p:h") . ' ls-files -- ' . expand("%:p")))

    let bufnr = bufnr('%')
    " clear signs
    call sign_unplace('DiffSignChange', {'buffer': bufnr})
    call sign_unplace('DiffSignAdd', {'buffer': bufnr})
    call sign_unplace('DiffSignDel', {'buffer': bufnr})

    let lines = systemlist('git -C ' . expand('%:p:h') . ' diff -U0 ' . expand("%:p")
      \. ' | grep -Po "^@@ \K-[0-9]+(,[0-9]+)? \+[0-9]+(,[0-9]+)?(?= @@)"')

    for item in lines
      let del_ins = split(item, ' ')
      let del = split(del_ins[0][1:], ',')
      let start_del = str2nr(del[0])
      let end_del = del->len() > 1 ? start_del + str2nr(del[1]) : start_del
      let ins = split(del_ins[1][1:], ',')
      let start_ins = str2nr(ins[0])
      let end_ins = ins->len() > 1 ? start_ins + str2nr(ins[1]) : start_ins

      if (start_ins == end_ins) && (start_del == end_del)
        " single line modification
        call sign_place(start_ins, 'DiffSignChange', 'DiffSignChange', bufnr, {'lnum': start_ins})
      elseif start_ins == end_ins
        " no insertion, only deletion
        call sign_place(start_ins, 'DiffSignDel', 'DiffSignDel', bufnr, {'lnum': start_ins})
      elseif start_del == end_del
        " new lines added
        for i in range(start_ins, end_ins - 1)
          call sign_place(i, 'DiffSignAdd', 'DiffSignAdd', bufnr, {'lnum': i})
        endfor
      else
        " modified block
        for i in range(start_del, end_del - 1)
          call sign_place(i, 'DiffSignChange', 'DiffSignChange', bufnr, {'lnum': i})
        endfor
      endif
    endfor
  endif
endfunction

autocmd BufReadPost,BufWritePost,BufEnter,DirChanged * if &filetype != '' | call DiffSign() | endif

" vim:ts=2:sw=2
