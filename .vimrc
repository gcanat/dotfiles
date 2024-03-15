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
set wildignore+=*.egg-info/**,.*,**/__pycache__/**,*.o,*.obj,*.bak,*.exe,*.swp,tags,target/**,bin/**,build/**
set fillchars=vert:│
set shortmess+=Tas
set undofile
set completeopt=menuone,preview
set wildcharm=<C-Z>
let &t_ut=''
let mapleader = ","

filetype plugin on
filetype indent on

augroup quickfix
	autocmd!
  " open quickfix at the bottom
  autocmd FileType qf wincmd J
	autocmd QuickFixCmdPost cgetexpr cwindow
	autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

augroup CursColLine
    autocmd!
    au WinLeave * setlocal nocursorline nocursorcolumn
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
augroup end

hi Normal guifg=NONE guibg=NONE

" easier on azerty keyboard
nmap à ]
nmap ç [
nmap ù }
nmap é {
nnoremap <leader>b :b <C-Z>
