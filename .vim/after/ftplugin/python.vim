if executable('ruff')
  " set formatprg
  " setlocal formatprg=black\ -q\ -l\ 120\ -
  " setlocal formatprg=black\ -q\ -l\ 120\ 2>/dev/null\ --stdin-filename\ %\ -
  setlocal formatprg=ruff\ format\ -n\ --stdin-filename\ %\ -
  " ensure we use formatprg isntead of formatexpr
  setlocal formatexpr=
endif
" mark current position, format entire file, return to mark
nnoremap <leader>ff magggqG'a
