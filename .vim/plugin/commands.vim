" Diff against a specificy commit hash or HEAD
function! Diff(spec)
	vertical new
	setlocal bufhidden=wipe buftype=nofile nobuflisted noswapfile
    let cmd = "++edit #"
	if len(a:spec)
    let cmd = "!git -C " . shellescape(fnamemodify(finddir('.git', '.;'), ':p:h:h')) . " show " . a:spec . ":#"
	endif
	execute "read " . cmd
	silent 0d_
	diffthis
	wincmd p
	diffthis
endfunction
command! -nargs=? Diff call Diff(<q-args>)

" Grep using grepprg
function! Grep(...)
	return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
endfunction

command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)

cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'

" command! -nargs=+ -complete=file_in_path -bar VimGrep noautocmd vimgrep <args> | cw
command! -nargs=+ -complete=file_in_path -bar VimGrep execute('silent! noautocmd vimgrep /' . split(<q-args>, ' ')[0] . '/j ' . split(<q-args>, ' ')[1] .' | cw')
command! -nargs=+ -complete=file_in_path -bar GitGrep silent! Ggrep <args> | cw


" try to use fd to find files
set errorformat+=%f
if executable("fd")
  let g:findcmd = "fd \--type f"
elseif executable("fdfind")
  let g:findcmd = "fdfind \--type f"
else
  let g:findcmd = "find"
endif

function! Find(...)
	return system(join([g:findcmd] + [expandcmd(join(a:000, ' '))], ' '))
endfunction
command! -nargs=+ -complete=file_in_path -bar Find cgetexpr Find(<f-args>)


function! Commit(...)
	let commitcmd = "git log --graph --pretty=format:'%h - %d %s (%cr) <%an>'"
	return system(commitcmd)
endfunction
command! -nargs=0 -bar Commit cgetexpr Commit()

" :GB to git blame current line :%GB to blame the whole file, :7,13GB blame range
command! -range GB echo join(systemlist("git -C " . shellescape(expand('%:p:h')) . " blame -L <line1>,<line2> " . expand('%:t')), "\n")

command! -bang -nargs=1 Global call setloclist(0, [], ' ',
	\ {'title': 'Global<bang> ' .. <q-args>,
	\  'efm':   '%f:%l:%c\ %m,%f:%l',
	\  'lines': execute('g<bang>/' .. <q-args> .. '/#')
	\           ->split('\n')
	\           ->map({_, val -> expand("%") .. ":" .. trim(val)->substitute('^\d\+','&:' .. trim(val)->substitute('^\d\+ ','','')->charidx(trim(val)->substitute('^\d\+','','')->match(<q-args>)),'')})
	\ })

" " interactive file search using ripgrep + fzf
" function! FZF() abort
"     let l:tempname = tempname()
"     execute 'silent !rg --files . | fzf -m --border' . '| awk ''{ print $1":1:0" }'' > ' . fnameescape(l:tempname)
"     try
"         execute 'cfile ' . l:tempname
"         redraw!
"     finally
"         call delete(l:tempname)
"     endtry
" endfunction

" " :Files
" command! -nargs=* Files call FZF()
" nnoremap <space>f :Files<cr>

" " interactive grep file content using ripgrep + fzf
" function! RG(args) abort
"     let l:tempname = tempname()
"     let l:pattern = '.'
"     if len(a:args) > 0
"         let l:pattern = a:args
"     endif
"     " rg --vimgrep <pattern> | fzf -m > file
"     execute 'silent !rg --no-heading --line-number --column --smart-case ''' .  l:pattern . ''' | fzf -m --border --delimiter : --nth 3.. > ' . fnameescape(l:tempname)
"     try
"         execute 'cfile ' . l:tempname
"         redraw!
"     finally
"         call delete(l:tempname)
"     endtry
" endfunction

" " :Rg [pattern]
" command! -nargs=* Rg call RG(<q-args>)

" " <space>/
" nnoremap <space>/ :Rg<cr>

function! CurrentGitStatus()
    let gitoutput = systemlist('cd '.expand('%:p:h:S').' 2>/dev/null'.' && git status -s 2>/dev/null')
    let gitbranch = system('cd '.expand('%:p:h:S').' 2>/dev/null'.' && git branch --show-current 2>/dev/null | tr -d "\n"')
    if len(gitbranch) > 0
        let b:gitstatus = gitbranch .'/'. strpart(get(gitoutput, 0, ' '), 0, 2)
    else
        let b:gitstatus = ''
    endif
endfunc
autocmd BufEnter,BufWritePost * call CurrentGitStatus()

set statusline=
set statusline+=%#PmenuSel#
" set statusline+=%{StatuslineGit()}
" set statusline+=%{FugitiveStatusline()}
set statusline+=%{b:gitstatus}
set statusline+=%#StatusLine#
set statusline+=\ %f
set statusline+=%m\ 
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
