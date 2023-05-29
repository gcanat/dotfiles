set termguicolors
set nu
set relativenumber
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set numberwidth=5
set autoindent
set clipboard=unnamed
let mapleader = ","
set encoding=utf-8
set updatetime=100
set laststatus=2
set hidden
set shell=/bin/bash

filetype plugin on
filetype indent on
" disable vi compatibility
set nocompatible

" Make the escape key more responsive by decreasing the wait time for an
" escape sequence (e.g., arrow keys).
set ttimeout
set ttimeoutlen=100
" incremental search
set incsearch
set scrolloff=4
" Disable a legacy behavior that can break plugin maps.
set nolangremap
" Saving options in session and view files causes more problems than it
" solves, so disable it.
set sessionoptions-=options
set viewoptions-=options

" auto install vim-plug if necessary
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
	" fuzzy finder
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'stsewd/fzf-checkout.vim'
	" lsp and completion
	Plug 'prabirshrestha/vim-lsp'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'sheerun/vim-polyglot'
	" colorscheme
	" Plug 'kyoz/purify', { 'rtp': 'vim' }
	" Plug 'morhetz/gruvbox'
	Plug 'catppuccin/vim'
	" git signs in gutter
	Plug 'airblade/vim-gitgutter'
	" git integration
	Plug 'tpope/vim-fugitive'
	" comment
	Plug 'tpope/vim-commentary'

call plug#end()

if executable('pylsp')
	" pip install python-lsp-server
	au User lsp_setup call lsp#register_server({
		\ 'name': 'pylsp',
		\ 'cmd': {server_info->['pylsp']},
		\ 'allowlist': ['python'],
		\ 'workspace_config': {
		\   'pylsp': {
		\     'plugins': {
		\       'ruff': { "enabled" : 1, "ignore" : ["F401"], "lineLength" : 120 }
	  \     }
	  \   }
	  \  }
		\ })
endif

function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=yes
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> gs <plug>(lsp-document-symbol-search)
	nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
	nmap <buffer> gr <plug>(lsp-references)
	nmap <buffer> gi <plug>(lsp-implementation)
	nmap <buffer> gt <plug>(lsp-type-definition)
	nmap <buffer> <leader>rn <plug>(lsp-rename)
	nmap <buffer> [d <plug>(lsp-previous-diagnostic)
	nmap <buffer> ]d <plug>(lsp-next-diagnostic)
	nmap <buffer> K <plug>(lsp-hover)
	nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
	nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
	nnoremap <buffer> <space>d :LspDocumentDiagnostics<CR>
	nnoremap <buffer> <space>ca :LspCodeAction<CR>


	let g:lsp_format_sync_timeout = 1000
	autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

	" refer to doc to add more commands
endfunction

augroup lsp_install
	au!
	" call s:on_lsp_buffer_enabled only for languages that has the server registered.
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" use lua if available
let g:lsp_use_lua = has('nvim-0.4.0') || (has('lua') && has('patch-8.2.0775'))
let g:lsp_auto_enable = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_float_delay = 500
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_virtual_text_align = 'after'


" Tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" force completion refresh
imap <c-space> <Plug>(asyncomplete_force_refresh)

" fzf options
let g:fzf_command_prefix = 'Fzf'
let g:fzf_preview_window = ['right,60%,<70(up,40%)', 'ctrl-f']
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" fzf mappings: lets try to use some similar to helix
nnoremap <space>f :FzfFiles<CR>
nnoremap <space>b :FzfBuffers<CR>
nnoremap <space>o :FzfHistory<CR>
nnoremap <space>/ :FzfRg<CR>

" others that are not in helix, lets fallacbk to neovim bindings
nnoremap <leader>gs :FzfGFiles?<CR>
" commits for the current buffer
nnoremap <leader>gc :FzfBCommits<CR>
nnoremap <leader>fb :FzfLines<CR>

" keymaps help
nmap <space>? <plug>(fzf-maps-n)
xmap <space>? <plug>(fzf-maps-x)
omap <space>? <plug>(fzf-maps-o)

" GitGutter mappings
" <Leader>hs : stage hunk
" <Leader>hu : undo staged hunk
" <Leader>hp : preview hunk
nnoremap <leader>hd :GitGutterDiffOrig<CR>
" GitGutterFold : fold all unchanged lines, Use `zr` to unfold 3 lines of context above and below a hunk

set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

set background=dark
syntax on
" colorscheme purify
" colorscheme retrobox
" colorscheme gruvbox
colorscheme catppuccin_macchiato
" set t_Co=16
