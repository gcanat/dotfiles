vim9script

if exists("g:loaded_fugitive")
  command! -nargs=* Glog Git log --oneline --decorate --graph --follow <args>
  command! Gpull Git pull
  command! Gpush Git push
  # set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
endif

if exists('g:loaded_devdocs')
  autocmd FileType python call g:DevdocsOptionsSet({slugs: ['python~3.8', 'numpy~1.23', 'pytorch~1', 'scikit_learn', 'scikit_image', 'pandas~1']})
  autocmd FileType rust call g:DevdocsOptionsSet({slugs: ['rust']})
  nnoremap <leader>df :DevdocsFind<CR>
  nnoremap <leader>di :DevdocsInstall<CR>
  nnoremap <leader>du :DevdocsUninstall<CR>
endif

if exists('g:loaded_scope')
  import autoload 'scope/fuzzy.vim'
  fuzzy.OptionsSet({
    grep_echo_cmd: false,
    grep_skip_len: 3,
    # timer_delay: 20,
    # grep_poll_interval: 100,
  })
  import autoload 'scope/popup.vim' as sp
  sp.OptionsSet({
    borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
    bordercharsp: ['─', '│', '─', '│', '╭', '╮', '┤', '├'],
  })
  augroup scope-quickfix-history
    autocmd!
    autocmd QuickFixCmdPost clist cwindow
    autocmd QuickFixCmdPost llist lwindow
  augroup END
  nnoremap <space>fe <scriptcmd>fuzzy.File('fdfind -tf --follow', 100000)<CR>
  nnoremap <space>fg <scriptcmd>fuzzy.Grep('rg --column --no-heading -g "!*.ipynb" --smart-case')<CR>
  # nnoremap <space>fx <scriptcmd>fuzzy.Grep()<CR>
  nnoremap <space>fm <scriptcmd>fuzzy.MRU()<CR>
  nnoremap <space>fk <scriptcmd>fuzzy.Keymap()<CR>
  nnoremap <space>fb <scriptcmd>fuzzy.Buffer()<CR>
  nnoremap <space>fq <scriptcmd>fuzzy.Quickfix()<CR>
  # search word under cursor
  nnoremap <space>gw <scriptcmd>fuzzy.Grep(null_string, true, '<cword>')<CR>
else
  nnoremap <space>gw silent! noautocmd Grep <cword><CR>
endif

if exists("g:loaded_lsp")
  g:LspOptionsSet({
    completionMatcher: 'fuzzy',
    completionTextEdit: false,
    showInlayHints: false,
    showDiagWithVirtualText: false,
    autoHighlightDiags: true,
    autoComplete: true,
    diagSignErrorText: 'E',
    diagSignInfoText: 'I',
    diagSignHintText: 'H',
    diagSignWarningText: 'W',
    useQuickfixForLocations: true,
    filterCompletionDuplicates: true,
    useBufferCompletion: true
  })
  if executable('clangd')
    g:LspAddServer([{
      name: 'clangd',
      filetype: ['c', 'cpp'],
      path: 'clangd',
      args: ['--background-index']
    }])
  endif
  if executable('rust-analyzer')
    g:LspAddServer([{
      name: 'rustanalyzer',
      filetype: ['rust'],
      path: 'rust-analyzer',
      args: [],
      syncInit: true
    }])
  endif
  if executable('pylsp')
    g:LspAddServer([{
      name: 'pylsp',
      filetype: ['python'],
      path: 'pylsp',
      args: ['--check-parent-process'],
      debug: false
    }])
  endif
  if executable('vim-language-server')
    g:LspAddServer([{
     name: 'vimls',
     filetype: 'vim',
     path: exepath('vim-language-server'),
     args: ['--stdio']
   }])
  endif
  # set keymappings
  nnoremap gd :LspGotoDefinition<CR>
  nnoremap gs :LspDocumentSymbol<CR>
  nnoremap gS :LspSymbolSearch<CR>
  nnoremap gr :LspShowReferences<CR>
  nnoremap gi :LspPeekImpl<CR>
  nnoremap <leader>rf :LspPeekReferences<CR>
  nnoremap <leader>rn :LspRename<CR>
  nnoremap [d :LspDiagPrev<CR>
  nnoremap ]d :LspDiagNext<CR>
  nnoremap K :LspHover<CR>
  # nnoremap <expr><c-f> lsp#scroll(+4)
  # nnoremap <expr><c-d> lsp#scroll(-4)
  nnoremap <space>d :LspDiagShow<CR>
  nnoremap <space>ca :LspCodeAction<CR>
  nnoremap <leader>lf :LspFormat<CR>
endif
