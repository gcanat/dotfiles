vim9script

if exists("g:loaded_fugitive")
  command! -nargs=* Glog Git log --oneline --decorate --graph --follow <args>
  command! Gpull Git pull
  command! Gpush Git push
endif

if exists('g:loaded_devdocs')
  autocmd FileType python call g:DevdocsOptionsSet({slugs: ['python~3.12', 'numpy~2.0', 'pytorch~2', 'scikit_learn', 'scikit_image', 'pandas~2']})
  autocmd FileType rust call g:DevdocsOptionsSet({slugs: ['rust']})
  nnoremap <leader>df :DevdocsFind<CR>
  nnoremap <leader>di :DevdocsInstall<CR>
  nnoremap <leader>du :DevdocsUninstall<CR>
endif

if exists("g:loaded_lsp")
  g:LspOptionsSet({
    autoComplete: false,
    omniComplete: true,
    completionMatcher: 'icase',
    condensedCompletionMenu: false,
    # semanticHighlight: true,
    filterCompletionDuplicates: true,
    useQuickfixForLocations: true,
    useBufferCompletion: false,
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
      syncInit: true,
    # initializationOptions: { cargo: { features: ["ndarray"] } }
    }])
    autocmd! BufWritePre *.rs call execute('LspFormat')
  endif
  if executable('ruff')
    g:LspAddServer([{
      name: 'ruff',
      filetype: ['python'],
      path: 'ruff',
      args: ["server", "--preview"],
      features: {hover: false}
    }])
  endif
  if executable('jedi-language-server')
    g:LspAddServer([{
      name: 'jedi',
      filetype: ['python'],
      path: 'jedi-language-server',
    }])
  endif
  if executable('vim-language-server')
    g:LspAddServer([{
      name: 'vimls',
      filetype: 'vim',
      path: exepath('vim-language-server'),
      args: ['--stdio']
    }])
    autocmd! BufEnter *.vim nnoremap <buffer> K :LspHover<CR>
  endif
  if executable('texlab')
    var settings = {
      args: [],
      filetype: ["tex", "plaintex", "bib"],
      name: "texlab",
      path: "texlab",
      rootSearch: [".git", ".latexmkrc", ".texlabroot", "texlabroot", "Tectonic.toml"],
      workspaceConfig: {
        settings: {
          texlab: {
            bibtexFormatter: "texlab",
            build: {
              args: ["-pdf", "-interaction=nonstopmode", "-synctex=1", "%f"],
              executable: "latexmk",
              forwardSearchAfter: false,
              onSave: true
            },
            chktex: {onEdit: false, onOpenAndSave: false},
            diagnosticsDelay: 300,
            formatterLineLength: 80,
            forwardSearch: {executable: "zathura", args: ["--synctex-forward", "%l:1:%f", "%p"]},
            latexFormatter: "latexindent",
            latexindent: {modifyLineBreaks: false}
          }
        }
      }
    }
    g:LspAddServer([settings])

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
  autocmd! BufEnter *.py,*.rs,*.tex nnoremap <buffer> K :LspHover<CR>
  # nnoremap <expr><c-f> lsp#scroll(+4)
  # nnoremap <expr><c-d> lsp#scroll(-4)
  nnoremap <space>d :LspDiagShow<CR>
  nnoremap <space>ca :LspCodeAction<CR>
  nnoremap <leader>lf :LspFormat<CR>
endif

if exists('g:loaded_jupyter_vim')
  g:jupyter_highlight_cells = 1
  g:jupyter_cell_separators = ['##', '#%%', '# %%']
endif

if executable('jupytext')
  g:jupytext_fmt = 'py:percent'
  packadd jupytext.vim
endif

if exists('g:wiki_loaded')
  g:wiki_root = '~/wiki'
  g:markdown_fenced_languages = ['python']
endif

if exists('g:loaded_taglist')
  g:Tlist_Enable_Fold_Column = 0
  g:Tlist_Use_Right_Window = 1
  g:Tlist_Compact_Format = 1
  nnoremap <leader>tl :TlistToggle<CR>
  nnoremap <leader>tc :TlistClose<CR>
  nnoremap [t <plug>(TlistJumpTagUp)
  nnoremap ]t <plug>(TlistJumpTagDown)
endif

if exists('g:loaded_mundo')
  nnoremap <leader>ut :MundoToggle<CR>
endif

if exists('g:loaded_vimpector')
  nnoremap <leader>dc <Plug>VimspectorContinue
  nnoremap <leader>dx <Plug>VimspectorReset
  nnoremap <leader>dl <Plug>VimspectorRestart
  nnoremap <leader>dp <Plug>VimspectorPause
  nnoremap <leader>dt <Plug>VimspectorToggleBreakpoint
  nnoremap <leader>dT <Plug>VimspectorToggleConditionalBreakpoint
  nnoremap <leader>di <Plug>VimspectorStepInto
  nnoremap <leader>do <Plug>VimspectorStepOver
  nnoremap <leader>du <Plug>VimspectorStepOut
  nnoremap <leader>dR <Plug>VimspectorRunToCursor
  # for normal mode - the word under the cursor
  nmap <Leader>dh <Plug>VimspectorBalloonEval
  # for visual mode, the visually selected text
  xmap <Leader>dh <Plug>VimspectorBalloonEval

elseif exists('g:termdebug_loaded')
  nnoremap <leader>dl :Run<CR>
  nnoremap <leader>do :Over<CR>
  nnoremap <leader>dt :Break<CR>
  nnoremap <leader>di :Step<CR>
  nnoremap <leader>dc :Continue<CR>
  nnoremap <leader>dh :Evaluate<CR>
endif
# vim: ts=2 sts=2 sw=2 et
