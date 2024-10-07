augroup zaitheme
  autocmd!
  autocmd ColorScheme zaibatsu silent! hi Pmenu guifg=#ffffff guibg=#0e0024 gui=NONE cterm=NONE | hi StatusLine guifg=#0e0024 guibg=#9e9e9e gui=NONE cterm=NONE | hi PmenuKind guifg=#878092 guibg=#0e0024 gui=NONE cterm=NONE | hi Cursor guifg=#0e0024 guibg=#ffffff gui=NONE cterm=NONE | hi CursorIM guifg=#0e0024 guibg=#ffffff gui=NONE cterm=NONE
  autocmd ColorScheme zaibatsu silent! let &t_ti = &t_ti . "\033]10;#f6f3e8\007\033]11;#0e0024\007"
augroup END

augroup hinormal
  autocmd!
  autocmd ColorScheme * silent! hi Normal guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE
augroup END

if has("gui_running")
  " use habamax in gvim
  colorscheme habamax
else
  colorscheme kanagawa
  " colorscheme nod
  " colorscheme habamax
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


" autocmd BufEnter * set completepopup+=border:off

augroup CursColLine
    autocmd!
    au WinLeave * setlocal nocursorline nocursorcolumn
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    " disable cursorline in insert mode
    au InsertLeave * setlocal cursorline
    au InsertEnter * setlocal nocursorline
augroup end

augroup TexColorScheme
  autocmd!
  au WinLeave,BufWinLeave *.tex setl background=dark | :colorscheme kanagawa
  au VimEnter,WinEnter,BufWinEnter *.tex setl background=light | :colorscheme lunaperche

autocmd BufReadPre *.nfo :setlocal fileencodings=cp437,utf-8

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
