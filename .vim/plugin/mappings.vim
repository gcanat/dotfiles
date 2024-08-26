nnoremap - :Lex<CR>

" mark current position, format entire file, return to mark
nnoremap <leader>ff magggqG'a

" Grep the word under the cursor
nnoremap <leader>gw :Grep <C-R><C-W><CR>

nnoremap <space>b :b <C-Z>

" faster window navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" resize window width
nnoremap <c-(> <c-w><
nnoremap <c-)> <c-w>>

" just for fun
" nnoremap <c-t> :e <c-r>=system('rg --files . <bar> fzf -m --border --preview "fzf-preview.sh {}"')<cr><cr>:redraw!<cr>

nmap à ]
nmap ç [
nmap ù }
nmap é {
nnoremap ]q :cne<CR>
nnoremap [q :cpr<CR>
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>

" send selection to terminal window
xnoremap <expr> <space>t term#Send()
nnoremap <expr> <space>t term#Send()
nnoremap <expr> <space>tt term#Send() .. '_'

" display the commit that introduce the change on this line (or in the
" selection)
nnoremap <silent> <leader>gi <scriptcmd>vim9cmd git#ShowCommit(v:count)<CR>
xnoremap <silent> <leader>gi <scriptcmd>vim9cmd git#ShowCommit(v:count, line("v"), line("."))<CR>
nnoremap <silent> <leader>gb <scriptcmd>vim9cmd git#Blame()<CR>
xnoremap <silent> <leader>gb <scriptcmd>vim9cmd git#Blame(line("v"), line("."))<CR>

inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" fuzzy finder
nnoremap <leader>b <scriptcmd>vim9cmd fuzzy#Buffer()<CR>
nnoremap <leader>e <scriptcmd>vim9cmd fuzzy#File()<CR>
nnoremap <leader>fe <scriptcmd>vim9cmd fuzzy#FileTree()<CR>
nnoremap <leader>fg <scriptcmd>vim9cmd fuzzy#LiveGrep()<CR>
nnoremap <leader>ge <scriptcmd>vim9cmd fuzzy#GitFile()<CR>
nnoremap <leader>fm <scriptcmd>vim9cmd fuzzy#MRU()<CR>
nnoremap <leader>dj <scriptcmd>vim9cmd fuzzy#DumbJump()<CR>
nnoremap <leader>fs <scriptcmd>vim9cmd fuzzy#Session()<CR>
nnoremap <leader>fp <scriptcmd>vim9cmd fuzzy#Project()<CR>
nnoremap <leader>jl <scriptcmd>vim9cmd fuzzy#Jumplist()<CR>
nnoremap <leader>ch <scriptcmd>vim9cmd fuzzy#CmdHistory()<CR>

" run tests of current file
nnoremap <leader>tf <scriptcmd>vim9cmd term#TermPopup(['pytest', expand('%')])<CR>
" run all tests
nnoremap <leader>ta <scriptcmd>vim9cmd term#TermPopup(['pytest', 'tests/'])<CR>

" easily launch jupyterconnect
cnoreabbrev jpc JupyterConnect
