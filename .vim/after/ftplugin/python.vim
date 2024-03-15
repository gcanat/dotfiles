if executable('ruff')
  " set formatprg
  " setlocal formatprg=black\ -q\ -l\ 120\ -
  setlocal formatprg=black\ --fast\ -q\ -l\ 120\ 2>/dev/null\ --stdin-filename\ %\ -
  setl textwidth=120
  setl formatoptions=tcqjlron 
  " setl formatprg=ruff\ format\ -n\ --stdin-filename\ %\ -
  " ensure we use formatprg isntead of formatexpr
  setl formatexpr=
endif
" mark current position, format entire file, return to mark
nnoremap <leader>ff magggqG'a
