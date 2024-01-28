augroup vimrc
  autocmd!
  autocmd ColorScheme zaibatsu silent! hi Pmenu guifg=#ffffff guibg=#0e0024 gui=NONE cterm=NONE | hi StatusLine guifg=#0e0024 guibg=#9e9e9e gui=NONE cterm=NONE | hi PmenuKind guifg=#878092 guibg=#0e0024 gui=NONE cterm=NONE
augroup END

" set colorscheme at the end
colorscheme zaibatsu

augroup quickfix
	autocmd!
	autocmd QuickFixCmdPost cgetexpr cwindow
	autocmd QuickFixCmdPost lgetexpr lwindow
augroup END
