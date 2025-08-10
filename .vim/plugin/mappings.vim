nnoremap - :15Lex<CR>

" mark current position, format entire file, return to mark
nnoremap <leader>ff magggqG'a

" Grep the word under the cursor
nnoremap <leader>gw :Grep <C-R><C-W><CR>

nnoremap <space>b :b <C-@>

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
nnoremap ]l :lne<CR>
nnoremap [l :lpr<CR>
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
nnoremap <leader>gr <scriptcmd>vim9cmd git#BranchRev()<CR>
nnoremap <leader>gv <scriptcmd>vim9cmd git#PRreview()<CR>
" nnoremap <leader>gs <scriptcmd>vim9cmd git#SubmitReview()<CR>


inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"


" run tests of current file
nnoremap <leader>tf <scriptcmd>vim9cmd term#TermPopup(['pytest', expand('%')])<CR>
" run all tests
nnoremap <leader>ta <scriptcmd>vim9cmd term#TermPopup(['pytest', 'tests/'])<CR>

" easily launch jupyterconnect
cnoreabbrev jpc JupyterConnect

" mapping for pythondoc
exe 'nnoremap <buffer> dK :<c-u>Help <c-r><c-w>'..nr2char(&wildcharm) .. '<CR>'

" this messes up with fzf popup window:
" it will no close anymore when hitting <esc>
" tnoremap <esc> <c-w>N
