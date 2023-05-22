set termguicolors
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

filetype plugin on
filetype indent on
set nocompatible

call plug#begin()
	" fuzzy finder
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	" lsp and completion
	Plug 'prabirshrestha/vim-lsp'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'sheerun/vim-polyglot'
	" colorscheme
	" Plug 'kyoz/purify', { 'rtp': 'vim' }
	" git signs in gutter
	Plug 'airblade/vim-gitgutter'
	" comment
	Plug 'tpope/vim-commentary'

call plug#end()

if executable('pylsp')
	" pip install python-lsp-server
	au User lsp_setup call lsp#register_server({
		\ 'name': 'pylsp',
		\ 'cmd': {server_info->['pylsp']},
		\ 'allowlist': ['python'],
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

	let g:lsp_format_sync_timeout = 1000
	autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

	" refer to doc to add more commands
endfunction

augroup lsp_install
	au!
	" call s:on_lsp_buffer_enabled only for languages that has the server registered.
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" force completion refresh
imap <c-space> <Plug>(asyncomplete_force_refresh)

" fzf mappings
nnoremap <leader>ff :Files<CR>
nnoremap <leader>gs :GFiles?<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fo :History<CR>

" GitGutter mappins
" <Leader>hs : stage hunk
" <Leader>hu : undo staged hunk
" <Leader>hp : preview hunk
nnoremap <leader>hd :GitGutterDiffOrig<CR>
" GitGutterFold : fold all unchanged lines, Use `zr` to unfold 3 lines of context above and below a hunk

syntax on
" colorscheme purify
colorscheme retrobox
