nnoremap <F3> :Ex<CR>

" Grep the word under the cursor
nnoremap <leader>s :Grep <C-R><C-W><CR>

nnoremap <space>b :b <C-Z>

nmap ç ]
nmap é [
nnoremap ]q :cne<CR>
nnoremap [q :cpr<CR>

" use comment script from autoload/comment.vim
nnoremap <silent> <expr> gc comment#Toggle()
xnoremap <silent> <expr> gc comment#Toggle()
nnoremap <silent> <expr> gcc comment#Toggle() .. '_'

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
