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
set termguicolors
set background=dark

func! MapPath(key, val)
  return a:val != "." ? a:val[2:] . "/**" : a:val
endfunc

function! SetPath()
  let path_list = systemlist('find . -maxdepth 1 ! -path "./.git" ! -path "./target" ! -path "./bin" ! -path "./build" ! -path "./*.egg-info" ! -path "__pycache__" -type d')
  let paths = map(path_list, function('MapPath'))
  return join(paths, ",")
endfunction
execute "set path=,," . SetPath()

set wildignore+=*.egg-info/**,.*,**/__pycache__/**,*.o,*.obj,*.bak,*.exe,*.swp,*.zwc,tags
if has("patch-8.2.4325")
  set wildoptions+=pum,fuzzy
endif
set fillchars=vert:│
set shortmess+=OTas
set undofile
set completeopt=menuone,preview
set wildcharm=<C-Z>
let &t_ut=''
let mapleader = ","

" netrw
let g:netrw_banner=0 
let g:netrw_browse_split=4
let g:netrw_altv=1 
let g:netrw_liststyle=3

filetype plugin on
filetype indent on

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
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
nnoremap <leader>gw :Grep <C-R><C-W><CR>

if executable('rg')
  set grepprg=rg\ --vimgrep
else
  set grepprg=grep\ --color=never\ -REHIns\ --exclude-dir=.git\ --exclude-dir=target\ --exclude-dir=build\ --exclude=*.swp\ --exclude=*.zwc
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
  let g:findcmd = 'find . ! -path "./.git/**" ! -path "./target/**" ! -path "./bin/**" ! -path "./build/**" -type f -name'
endif

function! Find(...)
  let s:arg_list = g:findcmd[0:3] != "find" ? [a:1] : ["*" . a:1 . "*"]
  if a:0 > 1
    s:arg_list += a:000[1:]
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

" Poor man's fugitive
function! Commit(...)
  let commitcmd = "git log --graph --pretty=format:'%h - %d %s (%cr) <%an>'"
  return system(commitcmd)
endfunction
command! -nargs=0 -bar Commit cgetexpr Commit()

" show the diff of the current buffer against HEAD
nnoremap <leader>gf :new <bar> setl ft=diff <bar> r !git diff #<CR>1Gdd
" show git status in a new buffer
nnoremap <leader>gs :new gitstatus <bar> setl ft=git nobuflisted noswapfile <bar> r !git status --porcelain<CR>1Gdd
" show the diff of the commit under the cursor
nnoremap <leader>gc yiw<C-W>w:e! gitlog <bar> setl ft=git nobuflisted noswapfile <bar> r !git show <C-R>"<CR>1Gdd

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

" add 's' and 'S' mappings to stage/unstage files in gitstatus window
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
  au VimEnter,WinEnter,BufWinEnter gitstatus nnoremap = :r !git diff <cfile><CR>g;k2e
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

" Put all files changed in the quickfix list
" Usage: :DiffRev HEAD~1 or :DiffRev master
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

" populate qflist with the list of files changed in the current branch
" compared to the given commit or branch supplied as argument
command! -nargs=1 DiffRev call s:get_diff_files(<q-args>)
" vim:ts=2:sw=2
