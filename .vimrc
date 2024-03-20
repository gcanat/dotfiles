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
set path+=**
set wildignore+=*.egg-info/**,.*,**/__pycache__/**,*.o,*.obj,*.bak,*.exe,*.swp,*.zwc,tags,target/**,bin/**,build/**
set fillchars=vert:│
set shortmess+=Tas
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
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
nnoremap ]t :tabnext<CR>
nnoremap [t :tabprev<CR>
nnoremap <leader>gw :Grep <C-R><C-W><CR>

if executable('rg')
    set grepprg=rg\ --vimgrep
else
    set grepprg=grep\ --color=never\ -REHIns\ --exclude={\"*.git*\",\"*.swp\",\"*.zwc\"}
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

" try to use fd to find files
set errorformat+=%f
if executable("fd")
    let g:findcmd = "fd \--type f"
elseif executable("fdfind")
    let g:findcmd = "fdfind \--type f"
else
    let g:findcmd = "find"
endif

function! Find(...)
    if exists('*expandcmd')
        return system(join([g:findcmd] + [expandcmd(join(a:000, ' '))], ' '))
    else
        return system(join([g:findcmd] + [join(a:000, ' ')], ' '))
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
    echom join(gitoutput, ' ')
    let gitbranch = system('cd '.expand('%:p:h:S').' 2>/dev/null'.' && git branch --show-current 2>/dev/null | tr -d "\n"')
    echom gitbranch
    if len(gitbranch) > 0
        let b:gitstatus = gitbranch .'/'. strpart(get(gitoutput, 0, ' '), 0, 2)
    else
        let b:gitstatus = ''
    endif
endfunc

" autocmd BufEnter,BufWritePost * call CurrentGitStatus()
 
" set statusline=
" set statusline+=%#PmenuSel#
" set statusline+=%{b:gitstatus}
" set statusline+=%#StatusLine#
" set statusline+=\ %f
" set statusline+=%m\
" set statusline+=%=
" set statusline+=%#CursorColumn#
" set statusline+=\ %y
" set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" set statusline+=\[%{&fileformat}\]
" set statusline+=\ %p%%
" set statusline+=\ %l:%c
" set statusline+=\

function! Commit(...)
    let commitcmd = "git log --graph --pretty=format:'%h - %d %s (%cr) <%an>'"
    return system(commitcmd)
endfunction
command! -nargs=0 -bar Commit cgetexpr Commit()
