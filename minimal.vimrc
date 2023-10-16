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
" Beware it will recursively search in all dirs so dont use it in the root dir
set path+=**
" Display all matching files when we tab complete
set wildmenu wildignorecase
set wildignore+=*.egg-info/**,.*,**/__pycache__/**,*.git/**,**/build/**,**/target/**
set wildoptions+=pum

" use ripgrep as external grep tool
set grepprg=rg\ --vimgrep
set grepformat=%f:%l:%c:%m

" function to use grepprg with getexpr
function! Grep(...)
	return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
endfunction
" create commands Grep and LGrep
command! -nargs=+ -complete=file_in_path -bar Grep cgetexpr Grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)
" abbrev to replace :grep with :Grep and :lgrep with :LGrep
cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'

" try to use fd to find files
set errorformat+=%f
function! Find(...)
  let findcmd = "fd \--type\ f"
	return system(join([findcmd] + [expandcmd(join(a:000, ' '))], ' '))
endfunction
command! -nargs=+ -complete=file_in_path -bar Find cgetexpr Find(<f-args>)

" automatically open the quickfix window
augroup quickfix
	autocmd!
	autocmd QuickFixCmdPost cgetexpr cwindow
	autocmd QuickFixCmdPost lgetexpr lwindow
augroup END


" Make the escape key more responsive by decreasing the wait time for an
" escape sequence (e.g., arrow keys).
set ttimeout
set ttimeoutlen=100
" incremental search
set incsearch ignorecase smartcase
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
  Plug 'yegappan/lsp'
  " Plug 'girishji/vimcomplete'
  " Plug 'girishji/lsp-complete.vim'
	" Plug 'prabirshrestha/vim-lsp'
	" Plug 'prabirshrestha/asyncomplete.vim'
	" Plug 'prabirshrestha/asyncomplete-lsp.vim'
	" Plug 'sheerun/vim-polyglot'
	" colorscheme
	" Plug 'kyoz/purify', { 'rtp': 'vim' }
	" Plug 'morhetz/gruvbox'
	" Plug 'catppuccin/vim'
	" git signs in gutter
	Plug 'airblade/vim-gitgutter'
	" git integration
	Plug 'tpope/vim-fugitive'
	" comment
	Plug 'tpope/vim-commentary'

call plug#end()

" LSP servers and completion setup
let lspServers = [
\   #{
\     name: 'pylsp',
\     filetype: 'python',
\     path: exepath('pylsp'),
\     debug: v:false,
\   },
\   #{
\     name: 'rustanalyzer',
\     filetype: ['rust'],
\     path: exepath('rust-analyzer'),
\     args: [],
\     syncInit: v:true
\   },
\   #{
\     name: 'vimls',
\     filetype: 'vim',
\     path: exepath('vim-language-server'),
\     args: ['--stdio']
\   }
\ ]

let lspOpts = #{
  \ autoHighlightDiags: v:true,
  \ diagSignErrorText: '●',
  \ diagSignInfoText: '●',
  \ diagSignHintText: '●',
  \ diagSignWarningText: '●',
\}

autocmd VimEnter * call LspAddServer(lspServers)
autocmd VimEnter * call LspOptionsSet(lspOpts)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" autocmd VimEnter * VimCompleteEnable c cpp lua markdown python rust text vim
" let g:vimcomplete_noname_buf_enable = 0
" let g:vimcomplete_tab_enable = 1
autocmd BufEnter * set completepopup+=border:off

nnoremap gd :LspGotoDefinition<CR>
nnoremap gs :LspDocumentSymbol<CR>
nnoremap gS :LspSymbolSearch<CR>
nnoremap gr :LspShowReferences<CR>
nnoremap gi :LspPeekImpl<CR>
nnoremap gt :LspPeekReferences<CR>
nnoremap <leader>rn :LspRename<CR>
nnoremap (d :LspDiagPrev<CR>
nnoremap )d :LspDiagNext<CR>
nnoremap K :LspHover<CR>
" nnoremap <expr><c-f> lsp#scroll(+4)
" nnoremap <expr><c-d> lsp#scroll(-4)
nnoremap <space>d :LspDiagShow<CR>
nnoremap <space>ca :LspCodeAction<CR>

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
colorscheme retrobox
" colorscheme habamax
" set t_Co=16

" Function to diff current file against HEAD or commit
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

" navigate qflist and llist
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprev<CR>
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lprev<CR>

" easier window navigation
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" quickly show the buffer list in a completion menu
set wildcharm=<C-Z>
nnoremap <leader>b :b <C-Z>
