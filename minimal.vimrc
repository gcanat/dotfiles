" set showtabline=1
set termguicolors
set nu relativenumber
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set scl=yes
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

" Search down into subfolders
" Provides tab-completion for all file-related tasks
" Beware it will resursively search in all dirs so dont use it in the root dir
set path+=**
" Display all matching files when we tab complete
set wildmenu wildignorecase
set wildignore+=*.egg-info/**,.*,**/__pycache__/**

" Make the escape key more responsive by decreasing the wait time for an
" escape sequence (e.g., arrow keys).
set ttimeout
set ttimeoutlen=100
" incremental search
set incsearch ignorecase smartcase hlsearch
set scrolloff=4
" Disable a legacy behavior that can break plugin maps.
set nolangremap
" Saving options in session and view files causes more problems than it
" solves, so disable it.
set sessionoptions-=options
set viewoptions-=options

" tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
" netrw_gitignore#Hide() causes netrw to be super slow on big repo
" let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'
" Ex in a vertical split
nnoremap <F3> :Ex<CR>

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
let $FZF_DEFAULT_COMMAND='rg --files'
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

" restart ripgrep whenever the query string is updated
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command, '--delimiter', ':', '--nth', '4..']}
  let spec = fzf#vim#with_preview(spec, 'right', 'ctrl-f')
  call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
endfunction

" define new command named RG for this
command! -nargs=* -bang FzfRG call RipgrepFzf(<q-args>, <bang>0)

" fzf mappings: lets try to use some similar to helix
nnoremap <space>f :FzfFiles<CR>
nnoremap <space>b :FzfBuffers<CR>
nnoremap <space>o :FzfHistory<CR>
nnoremap <space>/ :FzfRG<CR>
" list branches
nnoremap <leader>gb :FzfGBranches<CR>

" others that are not in helix, lets fallacbk to neovim bindings
nnoremap <leader>gs :FzfGFiles?<CR>
" commit history
nnoremap <leader>gc :FzfCommits<CR>
" commits for the current buffer
nnoremap <leader>gf :FzfBCommits<CR>
" fuzzy search in the current buffer
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
colorscheme catppuccin_macchiato
" set t_Co=16
