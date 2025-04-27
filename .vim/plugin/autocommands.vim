augroup zaitheme
  autocmd!
  autocmd ColorScheme zaibatsu silent! hi Pmenu guifg=#ffffff guibg=#0e0024 gui=NONE cterm=NONE | hi StatusLine guifg=#0e0024 guibg=#9e9e9e gui=NONE cterm=NONE | hi PmenuKind guifg=#878092 guibg=#0e0024 gui=NONE cterm=NONE | hi Cursor guifg=#0e0024 guibg=#ffffff gui=NONE cterm=NONE | hi CursorIM guifg=#0e0024 guibg=#ffffff gui=NONE cterm=NONE
  autocmd ColorScheme zaibatsu silent! let &t_ti = &t_ti . "\033]10;#f6f3e8\007\033]11;#0e0024\007"
augroup END

" function! s:SetDiffHighlights()
"   if &background == "dark"
"     highlight DiffAdd gui=bold guifg=NONE guibg=#2e4b2e
"     highlight DiffDelete gui=bold guifg=NONE guibg=#4c1e15
"     highlight DiffChange gui=bold guifg=NONE guibg=#45565c
"     highlight DiffText gui=bold guifg=NONE guibg=#996d74
"   else
"     highlight DiffAdd gui=bold guifg=NONE guibg=palegreen
"     highlight DiffDelete gui=bold guifg=NONE guibg=tomato
"     highlight DiffChange gui=bold guifg=NONE guibg=lightblue
"     highlight DiffText gui=bold guifg=NONE guibg=lightpink
"   endif
" endfunction

" augroup diffcolors
"   autocmd!
"   autocmd Colorscheme * call s:SetDiffHighlights()
" augroup END

if has("gui_running")
  " use habamax in gvim
  colorscheme habamax
else
  augroup hinormal
    autocmd!
    autocmd ColorScheme habamax,wildcharm,nod,srcery,everforest,gruvbox* silent! hi Normal guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE
    autocmd ColorScheme habamax,wildcharm,nod,srcery silent! hi VertSplit guibg=NONE ctermbg=NONE
    autocmd ColorScheme * hi! link EndOfBuffer Normal | hi LineNr guibg=NONE ctermbg=NONE | hi! link SignColumn LineNr | hi! link CursorLineNr CursorLine | hi! link CursorLineSign CursorLine
    autocmd ColorScheme everforest silent! hi PmenuMatch ctermfg=167 ctermbg=237 guifg=#e67e80 guibg=#434f55
    autocmd ColorScheme gruvbox-material silent! hi PmenuMatch ctermfg=167 ctermbg=237 guifg=#e67e80 guibg=#3c3836
  augroup END
  colorscheme gruvbox-material
endif

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

augroup CursColLine
    autocmd!
    au WinLeave * setlocal nocursorline nocursorcolumn
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    " disable cursorline in insert mode
    au InsertLeave * setlocal cursorline
    au InsertEnter * setlocal nocursorline
augroup end

" augroup TexColorScheme
"   autocmd!
"   au WinLeave,BufWinLeave *.tex,*.bib setl background=dark | :colorscheme kanagawa
"   au VimEnter,WinEnter,BufWinEnter *.tex,*.bib setl background=light | :colorscheme lunaperche
" augroup end

autocmd VimEnter * set completepopup+=border:off

" Watch for pre-commit output
" function! s:AfterGit() abort
"   if !exists('*FugitiveResult')
"     return
"   endif
"   let result = FugitiveResult()
"   if !filereadable(get(result, 'file', '')) || get(result.args, 0, '') !=# 'commit' || !get(result, 'exit_status')
"     return
"   endif
"   exe 'cgetfile' fnameescape(result.file)
" endfunction

" augroup gitprecommit
"   autocmd!
"   autocmd User FugitiveChanged call s:AfterGit()
" augroup END

if exists("g:is_wayland") && g:is_wayland
  augroup wl-clipboard
    autocmd!
    autocmd FocusLost * :call system('wl-copy --trim-newline', @+)
    autocmd FocusGained * :let @+ = system('wl-paste -n')
  augroup END
endif
