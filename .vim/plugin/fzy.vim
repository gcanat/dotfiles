command! -nargs=+ FzyGrep :call fzy#Command(&grepprg . ' ' . <f-args>, "e")

" standard open
nnoremap <leader>fe <cmd>call fzy#Command(g:findcmd, "e")<CR>
nnoremap <leader>ge <cmd>call fzy#Command("git ls-files --other --full-name --cached --exclude-standard", "e")<CR>
nnoremap <leader>fg :FzyGrep 
nnoremap <leader>fm <cmd>call fzy#Command(fzy#Mru(), "e")<CR>
nnoremap <leader>b <cmd>call fzy#Command(fzy#Buffers(), "e")<CR>
nnoremap <leader>fh <cmd>call fzy#Command('cut -f 1 ' . findfile('doc/tags', &rtp, -1)->join(), "h")<CR>
nnoremap <leader>fk <cmd>call fzy#Command(execute("map")->split("\n"), "e")<CR>
nnoremap <space>gb <cmd>call fzy#Command("git branch -a -l \| sed 's/*/ /' \| cut -d ' ' -f3 \| fzy \| xargs git checkout", "", v:true)<CR>
nnoremap <space>gp <cmd>call fzy#Command("gh pr list \| fzy \| cut -f1 \| xargs -I % sh -c \"echo % > /tmp/prr_id; gh pr checkout %\"", "", v:true)<CR>
nnoremap <space>pr <scriptcmd>vim9cmd git#OpenReviewFile()<CR>

" open in vertical split
nnoremap <leader>vfe <cmd>call fzy#Command(g:findcmd, "vs")<CR>
nnoremap <leader>vge <cmd>call fzy#Command("git ls-files --other --full-name --cached --exclude-standard", "vs")<CR>
nnoremap <leader>vfm <cmd>call fzy#Command(fzy#Mru(), "vs")<CR>
nnoremap <leader>vb <cmd>call fzy#Command(fzy#Buffers(), "vs")<CR>

" vim: ts=2 sts=2 sw=2 tw=79 et
