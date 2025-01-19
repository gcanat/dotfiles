if !executable('fzf')
	echom "Fzf not detected"
	finish
endif

if executable('bat')
	let g:file_preview_cmd = 'bat -n --color=always {}'
else
	let g:file_preview_cmd = 'less {}'
endif

function! s:build_quickfix_list(lines)
	call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1 }'))
	copen
	cc
endfunction

let g:fzf_action = {
	\ 'ctrl-q': function('s:build_quickfix_list'),
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-j': 'split',
	\ 'ctrl-v': 'vsplit' }

function! Grepsink(line)
	let res = a:line->split(':')
	exe ':e +' . res[1] . ' ' . res[0]
endfunction

" select colorscheme
"nnoremap <leader>fc :call fzf#run({'source': map(split(globpath(&rtp, 'colors/*.vim')),
"			\               'fnamemodify(v:val, ":t:r")'),
"			\ 'sink': 'colo', 'left': '25%'})<CR>

" find files
nnoremap <leader>fe :call FzfFiles()<CR>
" grep files
nnoremap <leader>fg :Rg<CR>
" grep word under cursor
nnoremap <leader>gw :Rg <c-r><c-w><CR>
" buffers
nnoremap <leader>b :call FzfBuffers()<CR>
" recent files
nnoremap <leader>fm :call FzfMru()<CR>
" git commit log
nnoremap <space>gc :call FzfGitlog()<CR>
" git stash
nnoremap <space>gs :call FzfGitStash()<CR>
" git blame
nnoremap <space>gb :call FzfBlame()<CR>
nnoremap <space>gl :call FzfGitlogLine(line("."), line("."))<CR>
xnoremap <space>gl :call FzfGitlogLine(line("v"), line("."))<CR>

function! FzfFiles()
	call fzf#run(fzf#wrap({
				\ 'source': 'rg --files .',
				\ 'options': ['--reverse', '--prompt', 'Files> ',
				\ '--preview', g:file_preview_cmd,
				\ '--preview-window', 'hidden',
				\ '--bind', 'f4:toggle-preview']
				\ }))
endfunction

function! RipgrepFzf(query, fullscreen)
	let command_fmt = 'rg -HS --no-heading --column --smart-case %s || true'
	let initial_command = a:query->len() > 0 ? printf(command_fmt, shellescape(a:query)) : "true"
	let reload_command = printf(command_fmt, '{q}')
	let spec = {
		\ 'source': initial_command,
		\ 'options': ['--reverse', '--phony', '--query', a:query,
		\ '--bind', 'change:reload:'.reload_command, '--prompt', 'Grep> '],
		\ 'sink': function('Grepsink')
		\ }
	call fzf#run(fzf#wrap(spec))
endfunction

command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

function! s:mapbufinfo(k, v)
	let binfo = {
		\ 'bufnr': a:v['bufnr'],
		\ 'text': bufname(a:v['bufnr']) ?? '[' . a:v['bufnr'] . ': No Name]',
		\ 'lastused': a:v['lastused'],
		\ 'winid': len(a:v['windows']) > 0 ? a:v['windows'][0] : -1,
		\ }
	return binfo
endfunction

function! FzfBuffers()
	let buflist = mapnew(getbufinfo({'buflisted': 1}), function('s:mapbufinfo'))
	let buflist = sort(buflist,{i, j -> i.lastused > j.lastused ? -1 : i.lastused == j.lastused ? 0 : 1})
	" Alternate buffer first, current buffer second
	if (buflist->len() > 1 && buflist[0].bufnr == bufnr())
		let [buflist[0], buflist[1]] = [buflist[1], buflist[0]]
	endif
	let buffers = mapnew(buflist, {k, v -> v['text']})
	call fzf#run(fzf#wrap({'source': buffers, 'options': ['--reverse', '--prompt', 'Buffers> ']}))
endfunction

function! FzfMru()
	let mru = v:oldfiles->filter({_, v ->
		\ filereadable(fnamemodify(v, ":p")) &&
		\ v !~ '\~\\AppData\\Local\\Temp\\.*\.tmp' &&
		\ v !~ '.*\.\?\(vim\|vimfiles\)[/\\]pack[/\\].*doc[/\\].*\.txt' &&
		\ fnamemodify(v, ":p") !~ escape($VIMRUNTIME, '\')  .. '.*[/\\]doc[/\\].*\.txt'
		\ })
	call fzf#run(fzf#wrap({'source': mru, 'options': ['--reverse', '--prompt', 'Recent> ']}))
endfunction

function! FzfGitlog()
	let git_log = systemlist('git log --graph --color --format="%C(white)%h - %C(green)%cs - %C(blue)%s%C(red)%d"')
	let preview_cmd = 'git show --color $(echo {} | grep -o "[a-f0-9]\{7\}" | sed -n "1p")'
	let spec = {
		\ 'source': git_log,
		\ 'options': ['--ansi', '--reverse', '--no-sort', '--prompt', 'Git log> ',
		\ '--preview', preview_cmd, '--bind', 'ctrl-u:preview-half-page-up', '--bind',
		\ 'ctrl-d:preview-half-page-down'], 'window': {'height': 0.9, 'width': 0.9}
		\ }
	call fzf#run(fzf#wrap(spec))
endfunction

function! FzfGitlogLine(...)
	let cmd = 'git log --graph --color -s -L ' . a:1 . ',' . a:2 . ':' . buffer_name('%') .' --format="%C(white)%h - %C(green)%cs - %C(blue)%s%C(red)%d"'
	let git_log = systemlist(cmd)
	let preview_cmd = 'git show --color $(echo {} | grep -o "[a-f0-9]\{7\}" | sed -n "1p") -- ' . buffer_name('%')
	let spec = {
		\ 'source': git_log,
		\ 'options': ['--ansi', '--reverse', '--no-sort', '--prompt', 'Git log lines> ',
		\ '--preview', preview_cmd, '--bind', 'ctrl-u:preview-half-page-up', '--bind',
		\ 'ctrl-d:preview-half-page-down'], 'window': {'height': 0.9, 'width': 0.9}
		\ }
	call fzf#run(fzf#wrap(spec))
endfunction

function! FzfGitStash()
	let cmd = 'git --no-pager stash list'
	let prev = 'git --no-pager stash show --patch --color $(echo {1} | cut -c8)'
	let apply_cmd = 'enter:execute(git stash apply $(echo {1} | cut -c8))+reload:' . cmd
	let drop_cmd = 'ctrl-x:execute(git stash drop $(echo {1} | cut -c8))+reload:' . cmd
	call fzf#run(fzf#wrap({
		\ 'source': systemlist(cmd),
		\ 'options': ['--reverse', '--prompt', 'Stash> ', '--preview', prev, '--header',
		\ '> ENTER (apply stash) CTRL-X (drop stash)',
		\ '--bind', apply_cmd, '--bind', drop_cmd]
		\ }))
endfunction

function! FzfBlame()
	let cmd = 'git blame  ' . expand('%')
	let prev = 'git show --color {1} -- ' . expand('%')
	call fzf#run(fzf#wrap({
				\ 'source': systemlist(cmd),
				\ 'options': ['--reverse', '--prompt', 'Blame> ', '--preview', prev],
				\ 'window': {'height': 0.9, 'width': 0.9}
				\ }))
endfunction
