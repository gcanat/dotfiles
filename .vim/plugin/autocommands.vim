augroup zaitheme
  autocmd!
  autocmd ColorScheme zaibatsu silent! hi Pmenu guifg=#ffffff guibg=#0e0024 gui=NONE cterm=NONE | hi StatusLine guifg=#0e0024 guibg=#9e9e9e gui=NONE cterm=NONE | hi PmenuKind guifg=#878092 guibg=#0e0024 gui=NONE cterm=NONE | hi Cursor guifg=#0e0024 guibg=#ffffff gui=NONE cterm=NONE | hi CursorIM guifg=#0e0024 guibg=#ffffff gui=NONE cterm=NONE
  autocmd ColorScheme zaibatsu silent! let &t_ti = &t_ti . "\033]10;#f6f3e8\007\033]11;#0e0024\007"
augroup END

augroup retrotheme
  autocmd!
  autocmd ColorScheme retrobox silent! let &t_ti = &t_ti . "\033]10;#ebdbb2\007\033]11;#1c1c1c\007"
augroup END

" set colorscheme at the end
" colorscheme zaibatsu
colorscheme retrobox
" colorscheme kanagawa

augroup quickfix
	autocmd!
	autocmd QuickFixCmdPost cgetexpr cwindow
	autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

augroup general | au!
    au VimLeavePre * :exe $'mksession! {g:vimdata}/sessions/LAST'
augroup end
