" b:pandoc_compiler_args = '-V geometry:margin=2cm'
compiler pandoc

" augroup mdpandoc
"   autocmd!
"   autocmd BufReadPost,BufNewFile *.md b:pandoc_compiler_args = '-V geometry:margin=2cm'
" augroup END

nnoremap <buffer> <leader>mk :make pdf<CR>
