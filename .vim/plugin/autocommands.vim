augroup zaitheme
  autocmd!
  autocmd ColorScheme zaibatsu silent! hi Pmenu guifg=#ffffff guibg=#0e0024 gui=NONE cterm=NONE | hi StatusLine guifg=#0e0024 guibg=#9e9e9e gui=NONE cterm=NONE | hi PmenuKind guifg=#878092 guibg=#0e0024 gui=NONE cterm=NONE | hi Cursor guifg=#0e0024 guibg=#ffffff gui=NONE cterm=NONE | hi CursorIM guifg=#0e0024 guibg=#ffffff gui=NONE cterm=NONE | hi Normal ctermfg=231 ctermbg=NONE guifg=#ffffff guibg=NONE
  autocmd ColorScheme zaibatsu silent! let &t_ti = &t_ti . "\033]10;#f6f3e8\007\033]11;#0e0024\007"
augroup END

augroup retrotheme
  autocmd!
  autocmd ColorScheme retrobox silent! let &t_ti = &t_ti . "\033]10;#ebdbb2\007\033]11;#1c1c1c\007"
augroup END

augroup nod
  autocmd!
  autocmd ColorScheme nod* silent! hi Normal guifg=NONE guibg=NONE
augroup END

colorscheme retrobox

augroup quickfix
	autocmd!
  " open quickfix at the bottom
  autocmd FileType qf wincmd J
	autocmd QuickFixCmdPost cgetexpr cwindow
	autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

augroup general | au!
    au VimLeavePre * :exe $'mksession! {g:vimdata}/sessions/LAST'
augroup end


" autocmd BufEnter * set completepopup+=border:off

augroup CursColLine
    autocmd!
    au WinLeave * setlocal nocursorline nocursorcolumn
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
augroup end
