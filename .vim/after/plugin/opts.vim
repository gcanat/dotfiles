vim9script

if exists("g:loaded_fugitive")
  command! Glog Git log -p --follow -- %
  command! GlogSummary Git log --follow -- %
  command! Gpull Git pull
  command! Gpush Git push
  set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
endif

if exists("g:loaded_lsp")
  g:LspOptionsSet({
    completionMatcher: 'fuzzy',
    showInlayHints: false,
    showDiagWithVirtualText: true,
    autoHighlightDiags: true,
    autoComplete: true,
    diagSignErrorText: '●',
    diagSignInfoText: '●',
    diagSignHintText: '●',
    diagSignWarningText: '●',
    useQuickfixForLocations: true,
    filterCompletionDuplicates: true
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
