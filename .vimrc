" installation first steps:
" Vundle:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" YouCompleteMe:
" apt install build-essential cmake vim-nox python3-dev
" apt install mono-complete golang nodejs default-jdk npm
" cd ~/.vim/bundle/YouCompleteMe
" python3 install.py --all


let mapleader = "," " map leader to comma

" flake8 settings
" let g:flake8_show_in_file=1
" autocmd BufWritePost *.py call flake8#Flake8()



"Commenting blocks of code.
 "augroup commenting_blocks_of_code
     "autocmd!
     "autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
     "autocmd FileType sh,ruby,python   let b:comment_leader = '# '
     "autocmd FileType conf,fstab       let b:comment_leader = '# '
     "autocmd FileType tex              let b:comment_leader = '% '
     "autocmd FileType mail             let b:comment_leader = '> '
     "autocmd FileType vim              let b:comment_leader = '" '
 "augroup END
 "noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
 "noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


augroup CursColLine
    autocmd!
    au WinLeave * setlocal nocursorline nocursorcolumn
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
augroup end

" shortcuts to easy switch between tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
" folding and unfolding parts of code
Plugin 'tmhedberg/SimpylFold'
" auto indentation
" Plugin 'vim-scripts/indentpython.vim'
Plugin 'Vimjas/vim-python-pep8-indent'
" autocompletion
Plugin 'Valloric/YouCompleteMe'
" syntax checking
Plugin 'vim-syntastic/syntastic'
" Plugin 'nvie/vim-flake8'
" color schemes
Plugin 'jnurmine/Zenburn'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'patstockwell/vim-monokai-tasty'
" file browsing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" code commenter
Plugin 'preservim/nerdcommenter'
" git integration
Plugin 'tpope/vim-fugitive'
" powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Automatically close parenthesis, etc
Plugin 'Townk/vim-autoclose'
" Better language packs
Plugin 'sheerun/vim-polyglot'
" indent guides
Plugin 'Yggdroot/indentLine'

" All of the Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1

" flag unnecessary whitespaces
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"au BufNewFile,BufRead *.py
    "\ set tabstop=4
    "\ set softtabstop=4
    "\ set shiftwidth=4
    "\ set textwidth=79
    "\ set expandtab
    "\ set autoindent
    "\ set fileformat=unix

"au BufNewFile,BufRead *.js, *.java, *.html, *.css
    "\ set tabstop=2
    "\ set softtabstop=2
    "\ set shiftwidth=2

" utf-8 support
set encoding=utf-8

" ensure that the auto-complete window goes away when you’re done with it
let g:ycm_autoclose_preview_window_after_completion=1
" shortcut for goto definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

if has('gui_running')
  set background=dark
  colorscheme vim-monokai-tasty
else
  colorscheme zenburn
endif

" switch between dark and light theme
" call togglebg#map("<F5>")

" ignore .pyc files in nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$', '\.pyo$'] "ignore files in NERDTree
" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>

" Autorefresh on tree focus
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()

" line numbering
set nu

" access sytem clipboard
set clipboard=unnamed

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" always show status bar
set ls=2

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set list lcs=tab:\|\ 
