" git-diff-aware version of gf commands.
" source: https://vi.stackexchange.com/questions/17905/how-to-jump-to-the-line-of-a-diff
nnoremap <buffer> <expr> gf  <SID>do_git_diff_aware_gf('gf')
nnoremap <buffer> <expr> gF  <SID>do_git_diff_aware_gf('gF')
nnoremap <buffer> <expr> <C-w>f  <SID>do_git_diff_aware_gf('<C-w>f')
nnoremap <buffer> <expr> <C-w><C-f>  <SID>do_git_diff_aware_gf('<C-w><C-f>')
nnoremap <buffer> <expr> <C-w>F  <SID>do_git_diff_aware_gf('<C-w>F')
nnoremap <buffer> <expr> <C-w>gf  <SID>do_git_diff_aware_gf('<C-w>gf')
nnoremap <buffer> <expr> <C-w>gF  <SID>do_git_diff_aware_gf('<C-w>gF')

function! s:do_git_diff_aware_gf(command)
  let target_path = expand('<cfile>')
  if target_path =~# '^[ab]/'  " with a peculiar prefix of git-diff(1)?
    if filereadable(target_path) || isdirectory(target_path)
      return a:command
    else
      " BUGS: Side effect - Cursor position is changed.
      let [_, c] = searchpos('\f\+', 'cenW')
      return c . '|' . 'v' . (len(target_path) - 2 - 1) . 'h' . a:command
    endif
  else
    return a:command
  endif
endfunction

" b:undo_ftplugin ..= ' | exe "nunmap <buffer> gf" | exe "nunmap <buffer> gF" | exe "nunmap <buffer> <C-w>f"'
" b:undo_ftplugin ..= ' | exe "nunmap <buffer> <C-w><C-f>" | exe "nunmap <buffer> <C-w>gf" | exe "nunmap <buffer> <C-w>F"'
" b:undo_ftplugin ..= ' | exe "nunmap <buffer> <C-w>gF"'
