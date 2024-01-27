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

" try to use fd to find files
set errorformat+=%f
function! Find(...)
  let findcmd = "fdfind \--type f"
	return system(join([findcmd] + [expandcmd(join(a:000, ' '))], ' '))
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

" interactive file search using ripgrep + fzf
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

" :Files
" command! -nargs=* Files call FZF()
" nnoremap <space>f :Files<cr>

" interactive grep file content using ripgrep + fzf
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

" :Rg [pattern]
" command! -nargs=* Rg call RG(<q-args>)

" <space>/
" nnoremap <space>/ :Rg<cr>
