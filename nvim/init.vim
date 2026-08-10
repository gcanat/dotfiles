" options {{{
set cot=menu,menuone,popup,fuzzy,noselect,noinsert
set wop=pum,tagfile,fuzzy wim=noselect:lastused,full
set fen fdl=99 fdm=expr fde=vim.treesitter.foldexpr
set mouse= tgc cul nu rnu spr scl=yes nosmd ph=20
set list lcs=tab:›\ ,nbsp:․,trail:·,extends:…,precedes:…
set ut=2000 ttimeout ttm=250 ic scs si sr sw=0 ts=4 et udf
set shada='100,<50,s10,:1000,/100,@100,h shm=CFOSWaco
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
syntax on | filetype plugin indent on
let mapleader = "," | let maplocalleader = " "
let &grepprg = ['rg', '-HS', '--no-heading', '--column', '-g', '"!*.ipynb"', '-g',
      \ '"!*__pycache__*"', '-g', '"!target/**"', '-g', '"!build/**"', '-g',
      \ '"!**/dist/**"', '-g', '"!tags"']->join()
" }}}

" autocommands {{{
au! ColorScheme * hi Normal guibg=NONE ctermbg=NONE
aug Qf " {{{
  au!
  au FileType qf nn <buffer> <Left> :colder<CR>| nn <buffer> <Right> :cnewer<CR>
  au Filetype qf wincmd J
  au QuickFixCmdPost cgetexpr cwindow
  au QuickFixCmdPost lgetexpr lwindow
aug END " }}}
au! FileType help,netrw nn <buffer> gq :bd<CR>
au! FileType * exe 'setl lcs+=leadmultispace:\⸱' .. repeat('\ ', &sw - 1)
au TextYankPost * silent! lua vim.hl.hl_op {higroup='Visual', timeout=300}
au TextPutPost  * silent! lua vim.hl.hl_op {higroup='Visual', timeout=300}
aug cmdline " {{{
  au! | au CmdlineChanged [/\?]  call wildtrigger()
  au CmdlineChanged : if getcmdcompltype() != 'shellcmd' | call wildtrigger() | endif
aug END " }}}
aug RestoreCursor " {{{
  au!
  au BufReadPre * autocmd FileType <buffer> ++once
    \ let s:line = line("'\"")
    \ | if s:line >= 1 && s:line <= line("$") && &filetype !~# 'commit'
    \      && index(['xxd', 'gitrebase'], &filetype) == -1
    \      && !&diff
    \ |   execute "normal! g`\""
    \ | endif
aug END " }}}
" }}}
packadd nvim.undotree

" lua config {{{
lua << EOF
require("core.mappings")
require("core.plugins")
require("core.statusline")
require("core.lsp")
require("core.snippet")
require("core.term")
EOF
" }}}
" vim:ts=2:sw=2:foldmethod=marker:foldlevel=1
