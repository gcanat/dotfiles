if &compatible
  set nocompatible
endif
syntax on
set autoindent signcolumn=yes encoding=utf-8 laststatus=2 hidden
set nu relativenumber
set tabstop=4 softtabstop=4 shiftwidth=4
if has('patch-9.1.1166')
  set wildmode=noselect:lastused,full
else
  set wildmode=list:longest,list:full
endif
set incsearch ignorecase smartcase
set updatetime=2000 ttimeout ttimeoutlen=250
if has('termguicolors') && (has('mac') || has('win32'))
	set termguicolors
endif
set background=dark

func! SetPath()
	let path_list = systemlist(
				\ 'find . -maxdepth 1 ! -path "./.*" ! -path "./target" ! -path "./bin"
				\ ! -path "./build" ! -path "./*.egg-info" ! -path "__pycache__" -type d')
	let paths = map(path_list, {_, val -> val != "." ? fnameescape(val[2:] . "/**") : val})
	return join(paths, ",")
endfunc
execute "set path=,," . SetPath()

if has('patch-9.1.0831')
	let g:files_cache = []
	let g:curr_dir = getcwd()

	augroup au_files_cache
		au!
		" popuplate files_cache asynchronously when starting vim
		au VimEnter * call timer_start(50, 'Find')
		au CmdlineEnter : if curr_dir != getcwd() | let g:files_cache = []
					\ | let g:curr_dir = getcwd() | endif
	augroup END

	func! Find(timer)
		" let start_time = reltime()
		if isdirectory(".git") && executable("git")
			let g:files_cache = systemlist("git ls-files")
		elseif executable("find")
			let g:files_cache = systemlist('find \! \( -path "*/.*" -prune -o -path "*/target/*" -prune
						\ -o -path "*/build/*" -prune -o -path "*/go/*" -prune -o -path "*/bin/*" -prune
						\ -o -name "*.swp" -o -name "*.o" \) -type f -follow')
		else
			let g:files_cache = globpath('.', '**', 0, 1)->filter({_, v -> !isdirectory(v)}
						\ )->mapnew({_, v -> v->substitute('^\.[\/]', "", "")})
		endif
		" let duration = start_time->reltime()->reltimefloat()
		" echom "Took: " . duration . " to populate files_cache."
	endfunc

	func! FindFiles(cmdarg, cmdcomplete)
		if empty(g:files_cache)
			call Find()
		endif
		if empty(a:cmdarg)
			return g:files_cache
		else
			return g:files_cache->matchfuzzy(a:cmdarg)
		endif
	endfunc

	set findfunc=FindFiles
endif

" better looking diff
if has("patch-8.1.0360")
	set diffopt+=vertical,algorithm:histogram
endif
if has("patch-9.1.1009")
	set diffopt+=linematch:60
endif
if has("patch-9.1.1243")
	set diffopt-=inline:simple
	set diffopt+=inline:char
endif

set wildignore+=*.egg-info/**,.*,**/__pycache__/**,*.o,*.obj,*.bak,*.exe,*.swp,*.zwc,*.un~,tags,*/target/**,*/build/**,*/node_modules/**,*/bin/**
if has("patch-8.2.4325")
	set wildoptions+=pum,fuzzy
endif

set fillchars=vert:│ shortmess+=TascI undofile
if has('patch-9.0.0738')
  set shortmess+=C
endif

set completeopt=menuone,preview,noinsert,noselect pumheight=20 inf
if has("patch-8.1.1884")
	set completeopt+=popup
	autocmd! VimEnter * set completepopup+=border:off
endif
if has("patch-9.1.1308")
	set cot-=fuzzy
	set cot+=nearest
endif
if has("patch-9.1.1311")
	set complete=.^5,w^5,b^5,t^5
endif

set wildcharm=<C-@>
let &t_ut=''
let mapleader = ","
set backspace=indent,eol,start
set list listchars=tab:›\ ,nbsp:․,trail:·,extends:…,precedes:…
set fillchars=vert:│


let g:vimdata=expand("~/.local/share/") . 'vim-data'
execute "set directory=" . g:vimdata . '/swap//'
execute "set backupdir=" . g:vimdata . '/backup//'
execute "set undodir=" . g:vimdata . '/undo//'
if !isdirectory(&undodir) | call mkdir(&undodir, "p") | endif
if !isdirectory(&backupdir) | call mkdir(&backupdir, "p") | endif
if !isdirectory(&directory) | call mkdir(&directory, "p") | endif

" netrw
let g:netrw_banner=0 
let g:netrw_browse_split=4
let g:netrw_altv=1 
let g:netrw_liststyle=3
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+,.*\.swp$,.*\.un~$,.git,target'
" let g:netrw_list_hide=netrw_gitignore#Hide() .. ',.git,.*\.swp$,.*\.un~$'

filetype plugin on
filetype indent on

autocmd! Colorscheme habamax,wildcharm,retrobox,nod,kanagawa,slate
	\ hi Normal guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE
	\ | hi VertSplit guibg=NONE ctermbg=NONE | hi! link TabPanelFill Normal
	\ | hi! link TabPanel Normal | hi! link Signcolumn Normal
autocmd! Colorscheme * hi link EndOfBuffer Normal

if has('patch-9.0.0335')
	colorscheme habamax
else
	colorscheme slate
endif

" use tab to trigger completion
inoremap <TAB> <c-n>
function! s:check_back_space() abort
  let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : "\<c-n>"

inoremap <expr> <Tab>     pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab>   pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <c-t> <c-x><c-]>
" inoremap <c-b> <c-x><c-n>
" inoremap <c-o> <c-x><c-o>
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" set omnifunc=syntaxcomplete#Complete

" easier on azerty keyboard
nmap à ]
nmap ç [
nmap ù }
nmap é {
xmap ù }
xmap é {
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <leader>b :b <c-@>
nnoremap - :15Lex<CR>
nnoremap <leader>fe :fin 
nnoremap <leader>fm :bro ol<CR>
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>
nnoremap ]l :lnext<CR>
nnoremap [l :lprev<CR>
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
nnoremap <leader>gw :Grep <C-r><C-w><CR>
nnoremap <leader>ff magggqG'a
nnoremap <space>a :ar **/*.
nnoremap <space>v :noa vim //j ## <bar> cw<left><left><left><left><left><left><left><left><left><left>

let grepcmd = 'LC_ALL=C\ grep\ --color=never\ -REHInsi'
for pattern in ['*.swp', '*.zwc', '*.un~', '*.pyc', '*.pyo', '*.ipynb', '*.orig', 'tags']
	let grepcmd .= '\ --exclude=\"' . pattern . '\"'
endfor 
for pattern in ['*.egg-info', '__pycache__', '.git', 'target', 'bin', 'build',
			\ '.*_cache', '.cache', '.cargo', 'node_modules', '.env', '.venv', '~/.*' ]
	let grepcmd .= '\ --exclude-dir=\"' . pattern . '\"'
endfor
execute "set grepprg=" . grepcmd

" Grep using grepprg
function! Grep(...)
	if exists('*expandcmd')
		return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
	else
		return system(join([&grepprg] + [join(a:000, ' ')], ' '))
	endif
endfunction
command! -nargs=+ -bar Grep  cgetexpr Grep(<f-args>)

function! Global(pat, bang) range
	let operator = a:bang == '!' ? '!~' : '=~'
	let padding_top = a:firstline > 1 ? a:firstline - 1 : 0
	let bufnr = bufnr()
	let qf_title_range = a:firstline == 1 && a:lastline == line('$') ? '%' : a:firstline .. ',' .. a:lastline
	let qf_list = getline(a:firstline, a:lastline)
			\ ->map({ idx, val -> { 'bufnr': bufnr, 'lnum': idx + 1 + padding_top, 'text': val, 'valid': 1 } })
			\ ->filter({ idx, val -> eval("val.text " .. operator .. "'.*' . a:pat . '.*'") })
	if qf_list->empty() == 0
		call setloclist(win_getid(), [], ' ', { 'title': ':' .. qf_title_range .. 'Global ' .. a:pat, 'items': qf_list })
		lwindow
		lfirst
	endif
endfunction
command! -bang -nargs=1 -range=% Global <line1>,<line2>call Global(<q-args>, expand('<bang>'))

func Eatchar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc

" easy insert **/*. in command line
cnoreabbrev rù **/*<c-r>=Eatchar('\m\s')<cr>

" Automatically open quickfix window
augroup quickfix
	autocmd!
	autocmd FileType qf wincmd J
	autocmd QuickFixCmdPost cgetexpr cwindow
	autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

" Function to grep the opened buffers
function! GrepallBuf(...)
	let s:buffers = map(getbufinfo({'buflisted': 1}), 'v:val.name')
	return system(join([&grepprg] + ['"' . expandcmd(join(a:000, ' ')) . '"'] + s:buffers, ' '))
endfunc

command! -nargs=1 Gbuf cgetexpr GrepallBuf(<f-args>)

" set errorformat+=%f

" Diff against a specificy commit hash or HEAD
function! Diff(spec)
	vertical new
	setlocal bufhidden=wipe buftype=nofile nobuflisted noswapfile
	let cmd = "++edit #"
	if len(a:spec)
		let git_root = system("git rev-parse --show-toplevel")->trim()
		let file_to_diff = fnamemodify(expand('#'), ':p:s?' . git_root . '/??')
		let cmd = "!git -C " . shellescape(git_root)  . " show " . a:spec . ":" . shellescape(file_to_diff)
	endif
	execute "read " . cmd
	silent 0d_
	let buf_ft = getbufvar(bufnr('#'), '&filetype')
	if buf_ft != ""
		execute 'set ft=' . buf_ft
	endif
	diffthis
	wincmd p
	diffthis
endfunction
command! -nargs=? Diff call Diff(<q-args>)

function! Gblame()
	let s:curr_line = getpos('.')[1]
	vertical new gitblame
	setlocal nowrap bufhidden=wipe buftype=nofile nobuflisted noswapfile
	vertical resize 50
	let cmd = "!git -C " . shellescape(fnamemodify(finddir('.git', '.;'), ':p:h:h')) . " blame " . "#"
	execute "silent read " . cmd
	silent 0d_
	set nomodifiable ft=git
	execute s:curr_line
	set scrollbind
	wincmd w
	set scrollbind
	sync
endfunction
nnoremap <leader>gb :call Gblame()<CR>

" Git Blame
command! -nargs=? -range GB echo join(systemlist("git -C " . shellescape(expand('%:p:h')) . " blame -L <line1>,<line2> <args> -- " . expand('%:t')), "\n")


if has("patch-8.1.1455")
	nnoremap <silent> <space>gi :call ShowCommit(v:count, line("."), line("."))<CR>
	command! -range CommitRange call ShowCommit(v:count, <line1>, <line2>)
	xnoremap <silent> <space>gi :CommitRange<CR>

	function! FilterKeys(winid, key)
		if a:key == "j"
			call win_execute(a:winid, "normal! \<C-d>")
			return v:true
		elseif a:key == "k"
			call win_execute(a:winid, "normal! \<C-u>")
			return v:true
		endif
		if a:key == "\<ESC>"
			call popup_close(a:winid)
			return v:true
		endif
		return v:true
	endfunc

	function! ShowCommit(...)
		let depth = (a:1 > 0 ? "" : " -n 1")
		let text = systemlist("git -C " . shellescape(fnamemodify(resolve(expand('%:p')), ":h")) . " log --no-merges" . depth . " -L " . shellescape(a:2 . ',' . a:3 . ':' . resolve(expand("%:p"))))
		if text->type() == v:t_string
			let text = text->trim("\<CR>")
		else
			let text = text->mapnew({ _, val -> trim(val, "\<CR>") })
		endif

		let winid = popup_atcursor(text, { "padding": [0,1,0,1], "pos": "botleft", "mapping": 0, "filter": funcref('FilterKeys') })
		call setbufvar(winbufnr(winid), "&filetype", "git")
	endfunc
endif

function! CurrentGitStatus()
	let gitoutput = systemlist('cd '.expand('%:p:h:S').' 2>/dev/null'.' && git status -s 2>/dev/null')
	let gitbranch = system('cd '.expand('%:p:h:S').' 2>/dev/null'.' && git branch --show-current 2>/dev/null | tr -d "\n"')
	if len(gitbranch) > 0
		let g:gitstatus = gitbranch .'/'. strpart(get(gitoutput, 0, ' '), 0, 2)
	else
		let g:gitstatus = ''
	endif
endfunc

augroup gitstatus
	autocmd!
	autocmd BufEnter,BufWritePost,ShellCmdPost * call CurrentGitStatus()
augroup END

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{g:gitstatus}
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

" set errorformat+=%o:%l:%c:%m
function! s:parse_log(val)
	let cmt_msg = split(a:val, ' - ')
	return cmt_msg[0] . ':1:1:' . cmt_msg[1]
endfunction

function! Glog(...)
	let commitcmd = "git log --oneline --pretty=format:'%h - %s (%cr) <%an>' " . join(a:000, ' ')
	let result = systemlist(commitcmd)
	return result->mapnew({ _, val -> s:parse_log(val)})
endfunction
command! -nargs=* -bar GcLog cgetexpr Glog(<f-args>)

function! GStatus()
	new gitstatus
	setl ft=git bufhidden=wipe buftype=nofile nobuflisted noswapfile
	silent! r !git status --porcelain
	silent 0d_
endfunction
" Open window with git status info
command! -nargs=0 G call GStatus()

" diff current file against merge base
nnoremap <space>dm :Diff <c-r>=GetMergeBase()<CR><CR>
nnoremap <space>dw :window diffthis<CR>
" diff current file against HEAD
nnoremap <leader>gf :new gitlog <bar> setl ft=diff bufhidden=wipe buftype=nofile <bar> silent! r !git diff #<CR>1Gdd
" show the diff for the commit SHA under the cursor
nnoremap <leader>gc yiw<C-W>w:e! gitlog <bar> setl ft=git bufhidden=wipe buftype=nofile nobuflisted noswapfile <bar> silent! r !git show <C-R>"<CR>1Gdd<C-W>w

" assuming qflist is popuplated with list of files modified by a PR, diff
" against last merge commit
function! Diffqf(spec)
	ccl
	wincmd o
	if (a:spec == 1)
		cnext
	else
		cprev
	endif
	" Diff against merge_base
	let merge_base = GetMergeBase()
	silent! call Diff(merge_base)
	cope
	wincmd j
endfunction
nnoremap ]r :call Diffqf(1)<CR>
nnoremap [r :call Diffqf(0)<CR>

function! GetMergeBase()
	let default_branch = trim(system('git rev-parse --abbrev-ref origin/HEAD | cut -c8-'))
	return trim(system($'git merge-base HEAD {default_branch} || echo {default_branch}'))
endfunc

function! GitAdd(...)
	let addcmd = "git add " . shellescape(expand('<cfile>'))
	silent let f = system(addcmd)
	execute "1,$d | silent! r !git status --porcelain"
endfunction
command! -nargs=0 -bar GitAdd call GitAdd()

function! GitReset(...)
	let addcmd = "git reset HEAD " . shellescape(expand('<cfile>'))
	silent let f = system(addcmd)
	execute "1,$d | silent! r !git status --porcelain"
endfunction
command! -nargs=0 -bar GitReset call GitReset()

" add mappings similar to fugitive
augroup Gitbuffer
	autocmd!
	au WinLeave gitstatus unmap s
	au WinLeave gitstatus unmap S
	au WinLeave gitstatus unmap =
	au WinLeave gitstatus unmap cc
	au WinLeave gitstatus unmap ce
	au WinLeave gitstatus,gitlog,gitblame unmap gq
	au WinLeave gitstatus unmap <leader>r
	au VimEnter,WinEnter,BufWinEnter gitstatus nnoremap s :GitAdd<CR>1Gdd
	au VimEnter,WinEnter,BufWinEnter gitstatus nnoremap S :GitReset<CR>1Gdd
	au VimEnter,WinEnter,BufWinEnter gitstatus nnoremap = $:silent! r !git diff <cfile><CR>g;k2e
	au VimEnter,WinEnter,BufWinEnter gitstatus nnoremap cc :!git commit -m ""<Left>
	au VimEnter,WinEnter,BufWinEnter gitstatus nnoremap ce :!git commit --amend --no-edit<CR>
	au VimEnter,WinEnter,BufWinEnter gitstatus nnoremap <leader>r :1,$d <bar> silent! r !git status --porcelain<CR>
	au VimEnter,WinEnter,BufWinEnter gitstatus,gitlog,gitblame nnoremap gq :bd!<CR>
augroup end

augroup CursColLine
	autocmd!
	au WinLeave * setlocal nocursorline nocursorcolumn
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au InsertEnter * setlocal nocursorline
	au InsertLeave * setlocal cursorline
augroup end


let s:git_status_dictionary = {
	\ "A": "Added",
	\ "B": "Broken",
	\ "C": "Copied",
	\ "D": "Deleted",
	\ "M": "Modified",
	\ "R": "Renamed",
	\ "T": "Changed",
	\ "U": "Unmerged",
	\ "X": "Unknown"
	\ }
function! s:get_diff_files(rev)
	let gitroot = system('git rev-parse --show-toplevel')->trim()
	let rev = a:rev == "" ? GetMergeBase() : a:rev
	let list = map(systemlist(
		\ 'git diff --name-status ' . rev),
		\ '{"filename":"' . fnameescape(gitroot) 
		\ . '/" . matchstr(v:val, "\\S\\+$"),"text":s:git_status_dictionary[matchstr(v:val, "^\\w")]}'
		\ )
	call setqflist(list)
	copen
endfunction

" populate qflist with files changed in a branch compared to commit or branch given as arg
command! -nargs=* DiffRev call s:get_diff_files(<q-args>)

" if has("patch-9.1.0913")
"   set messagesopt=wait:500,history:1000
" endif

" try to use comment builtin plugin
if has("patch-9.1.374")
	packadd comment
endif

if has("patch-8.1.0673")
	function! DiffSign()
		call sign_define('DiffSignChange', {'text': '~', 'texthl': 'Changed'})
		call sign_define('DiffSignAdd', {'text': '+', 'texthl': 'Added'})
		call sign_define('DiffSignDel', {'text': '-', 'texthl': 'Removed'})
		if &buftype == ''
					\&& system('git -C ' . expand("%:p:h") . ' rev-parse --is-inside-work-tree') == "true\n"
					\&& strlen(system('git -C ' . expand("%:p:h") . ' ls-files -- ' . expand("%:p")))
			let bufnr = bufnr('%')
			" clear signs
			call sign_unplace('DiffSignChange', {'buffer': bufnr})
			call sign_unplace('DiffSignAdd', {'buffer': bufnr})
			call sign_unplace('DiffSignDel', {'buffer': bufnr})

			let lines = systemlist('git -C ' . expand('%:p:h') . ' diff -U0 ' . expand("%:p")
				\. ' | grep -Po "^@@ \K-[0-9]+(,[0-9]+)? \+[0-9]+(,[0-9]+)?(?= @@)"')

			for item in lines
				let del_ins = split(item, ' ')
				let del = split(del_ins[0][1:], ',')
				let start_del = str2nr(del[0])
				let end_del = del->len() > 1 ? start_del + str2nr(del[1]) : start_del
				let ins = split(del_ins[1][1:], ',')
				let start_ins = str2nr(ins[0])
				let end_ins = ins->len() > 1 ? start_ins + str2nr(ins[1]) : start_ins

				if (start_ins == end_ins) && (start_del == end_del)
					" single line modification
					call sign_place(start_ins, 'DiffSignChange', 'DiffSignChange', bufnr, {'lnum': start_ins})
				elseif start_ins == end_ins
					" no insertion, only deletion
					call sign_place(start_ins, 'DiffSignDel', 'DiffSignDel', bufnr, {'lnum': start_ins})
				elseif start_del == end_del
					" new lines added
					for i in range(start_ins, end_ins - 1)
						call sign_place(i, 'DiffSignAdd', 'DiffSignAdd', bufnr, {'lnum': i})
					endfor
				else
					" modified block
					for i in range(start_del, end_del - 1)
						call sign_place(i, 'DiffSignChange', 'DiffSignChange', bufnr, {'lnum': i})
					endfor
				endif
			endfor
		endif
	endfunction
	autocmd BufReadPost,BufWritePost,BufEnter,DirChanged * if &filetype != '' | call DiffSign() | endif
endif

if has("patch-9.1.1227")
	packadd hlyank
endif

if (has('vim9script') ||  v:version > 900) && isdirectory($HOME . "/.vim/pack/download/opt/lsp")
	packadd lsp
	call LspOptionsSet(#{autoComplete: v:false, omniComplete: v:true})
	if executable("rust-analyzer")
		call LspAddServer([#{
			\ name: 'rustanalyzer',
			\ filetype: ['rust'],
			\ path: 'rust-analyzer',
			\ args: [],
			\ syncInit: v:true,
			\ }])
	endif
	if executable("ruff")
		call LspAddServer([#{
			\ name: 'ruff',
			\ filetype: ['python'],
			\ path: 'ruff',
			\ args: ["server", "--preview"],
			\ features: #{hover: v:false}
			\ }])
	endif
	if executable('jedi-language-server')
		call LspAddServer([#{
			\ name: 'jedi',
			\ filetype: ['python'],
			\ path: 'jedi-language-server',
			\ }])
	endif
	nnoremap gd :LspGotoDefinition<CR>
	nnoremap gs :LspDocumentSymbol<CR>
	nnoremap gS :LspSymbolSearch<CR>
	nnoremap gr :LspShowReferences<CR>
	nnoremap gi :LspPeekImpl<CR>
	nnoremap <leader>rf :LspPeekReferences<CR>
	nnoremap <leader>rn :LspRename<CR>
	nnoremap [d :LspDiagPrev<CR>
	nnoremap ]d :LspDiagNext<CR>
	autocmd! BufEnter *.py,*.rs,*.tex nnoremap <buffer> K :LspHover<CR>
	nnoremap <space>ds :LspDiagShow<CR>
	nnoremap <space>ca :LspCodeAction<CR>
	nnoremap <leader>lf :LspFormat<CR>
endif
if isdirectory($HOME . "/.vim/pack/download/opt/taglist")
	packadd taglist
endif

if executable('git-jump')
	command! -bar -nargs=* Jump cexpr system('git jump --stdout ' . expand(<q-args>)) | cope
	nnoremap <space>dj :Jump diff<CR>
	nnoremap <space>gg :Jump grep<space>
endif

" add gitignored files to wildignore
function! s:LocalWildignore(id)
	let s:root_dir = system('git rev-parse --show-toplevel')
	if s:root_dir[0:5] != 'fatal:'
		let &l:path = join(systemlist('git ls-tree -d --name-only -r HEAD'), ',')
		let &l:wildignore = (empty(&wildignore) ? '' : &wildignore..',') .. escape(join(systemlist('git check-ignore **/.* **/*'), ','), '{}\')
	endif
endfunc

" autocmd BufReadPost,BufNewFile * if executable('git') | call timer_start(50, 's:LocalWildignore') | endif

nnoremap <silent> <expr> <space>b ':b ' .. input(range(1, bufnr('$'))->filter(
			\ {_, v -> buflisted(v)})->map({_, v -> v .. ' ' .. (bufname(v) != '' ?
			\ fnamemodify(bufname(v), ':t') : '[No Name]')})->join("\n") .. "\nChoose
			\ buffer: ") .. '<CR>'

if has('patch-9.1.1576')
	let g:mru_cache = []
	let g:git_files_cache = []
	augroup cmdline
		autocmd!
		autocmd CmdlineChanged [/\?]  call wildtrigger()
		autocmd CmdlineChanged : if getcmdcompltype() != 'shellcmd' | call wildtrigger() | endif
		autocmd CmdlineEnter [:/\?] set pumheight=15
		autocmd CmdlineLeave [:/\?] set pumheight&
		autocmd CmdwinLeave : let g:mru_cache = [] | let g:git_files_cache = []
	augroup END

	func! GrepComplete(arglead, cmdline, cursorpos)
		return a:arglead != '' ? systemlist(&grepprg .. ' ' .. a:arglead) : []
  endfunc

	func! VisitFile(line)
		let qfitem = getqflist({'lines': [a:line]}).items[0]
		if qfitem->has_key('bufnr')
			let pos = qfitem.vcol > 0 ? 'setcharpos' : 'setpos'
			exec ':b +call\ ' .. pos ..'(".",\ [0,\ ' .. qfitem.lnum .. ',\ ' .. qfitem.col .. ',\ 0]) ' .. qfitem.bufnr
			call setbufvar(qfitem.bufnr, '&buflisted', 1)
		endif
  endfunc

	" Live grep in command line
	command! -nargs=+ -complete=customlist,GrepComplete LiveGrep call VisitFile(<q-args>)
  nnoremap <leader>fg :LiveGrep<space>

	command! -nargs=+ -complete=custom,MruComplete MRU edit <args>
	nnoremap <leader>fm :MRU<space>

	func! MruComplete(_a, _b, _c)
		if empty(g:mru_cache)
			let g:mru_cache =  v:oldfiles->copy()->filter({_, i -> i->fnamemodify(':p')->filereadable()})->map({_, i -> fnamemodify(i, ':~:.')})->join("\n")
		endif
		return g:mru_cache
	endfunc

	command! -nargs=+ -complete=custom,GitFilesComplete GitFiles edit <args>
	nnoremap <leader>ge :GitFiles<space>

	func! GitFilesComplete(_a, _b, _c)
		if empty(g:git_files_cache)
			let g:git_files_cache = system('git ls-files')
		endif
		return g:git_files_cache
	endfunc

	if has('patch-9.1.1738')
		" mapping for navigating cmd history
		cnoremap <expr> <Up>   wildmenumode() ? "\<C-E>\<Up>"   : "\<Up>"
		cnoremap <expr> <Down> wildmenumode() ? "\<C-E>\<Down>" : "\<Down>"
	endif
endif

if has('patch-9.1.1590')
	set ac
	set cpt=o^10,.^5,w^5,b^5,t^5
endif
" vim:ts=2:sw=2
