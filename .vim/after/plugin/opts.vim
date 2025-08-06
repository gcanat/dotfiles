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

if exists('g:loaded_scope')
  import autoload 'scope/fuzzy.vim'
  fuzzy.OptionsSet({
    grep_echo_cmd: false,
    grep_skip_len: 3,
    timer_delay: 20,
    # grep_poll_interval: 200,
    find_echo_cmd: true,
  })
  import autoload 'scope/popup.vim' as sp
  sp.OptionsSet({
    borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
    bordercharsp: ['─', '│', '─', '│', '╭', '╮', '┤', '├'],
    maxheight: 30,
    maxwidth: 120,
  })
  augroup scope-quickfix-history
    autocmd!
    autocmd QuickFixCmdPost clist cwindow
    autocmd QuickFixCmdPost llist lwindow
  augroup END
  if g:findcmd == 'find'
    nnoremap <leader>fe :Scope File<CR>
  else
    nnoremap <leader>fe <scriptcmd>fuzzy.File($'{g:findcmd}', 100000)<CR>
  endif
  if executable('rg')
    nnoremap <leader>fg <scriptcmd>fuzzy.Grep('rg -HS --no-heading --vimgrep -g "!*.ipynb" -g "!*.egg-info" -g "!*__pycache__*" -g "!tags"')<CR>
  else
    nnoremap <leader>fg :Scope Grep<CR>
  endif
  nnoremap <leader>fm <scriptcmd>fuzzy.MRU()<CR>
  nnoremap <leader>fk <scriptcmd>fuzzy.Keymap()<CR>
  nnoremap <leader>b <scriptcmd>fuzzy.Buffer()<CR>
  nnoremap <leader>fq <scriptcmd>fuzzy.Quickfix()<CR>
  # search word under cursor
  nnoremap <leader>gw <scriptcmd>fuzzy.Grep(null_string, true, '<cword>')<CR>
  nnoremap <leader>jl <scriptcmd>fuzzy.Jumplist()<CR>
  nnoremap <leader>jm <scriptcmd>fuzzy.Mark()<CR>
  nnoremap <leader>ls <scriptcmd>fuzzy.LspDocumentSymbol()<CR>
else
  nnoremap <leader>gw :Grep <cword><CR>
  if !exists("g:fzf_loaded")
    nnoremap <leader>b <scriptcmd>vim9cmd fuzzy#Buffer()<CR>
    nnoremap <leader>e <scriptcmd>vim9cmd fuzzy#File()<CR>
    nnoremap <leader>fe <scriptcmd>vim9cmd fuzzy#FileTree()<CR>
    nnoremap <leader>fg <scriptcmd>vim9cmd fuzzy#LiveGrep()<CR>
    nnoremap <leader>ge <scriptcmd>vim9cmd fuzzy#GitFile()<CR>
    nnoremap <leader>fm <scriptcmd>vim9cmd fuzzy#MRU()<CR>
    nnoremap <space>gp <scriptcmd>vim9cmd fuzzy#PRlist()<CR>
    nnoremap <leader>gc <scriptcmd>vim9cmd fuzzy#GitLog()<CR>
    nnoremap <space>gb <scriptcmd>vim9cmd fuzzy#GitBranch()<CR>
    nnoremap <space>vm <scriptcmd>vim9cmd fuzzy#Marks()<CR>
    nnoremap <leader>km <scriptcmd>vim9cmd fuzzy#KeyMaps()<CR>
  endif
  nnoremap <leader>dj <scriptcmd>vim9cmd fuzzy#DumbJump()<CR>
  nnoremap <leader>fs <scriptcmd>vim9cmd fuzzy#Session()<CR>
  nnoremap <leader>fp <scriptcmd>vim9cmd fuzzy#Project()<CR>
  nnoremap <leader>jl <scriptcmd>vim9cmd fuzzy#Jumplist()<CR>
  nnoremap <leader>ch <scriptcmd>vim9cmd fuzzy#CmdHistory()<CR>
  nnoremap <leader>fh <scriptcmd>vim9cmd fuzzy#Help()<CR>
  nnoremap <leader>wsf <scriptcmd>vim9cmd fuzzy#File('~/wiki')<CR>
endif

if exists("g:loaded_lsp")
  g:LspOptionsSet({
    # autoComplete: exists("g:loaded_vimcomplete") ? false : true,
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
  # if executable('ty')
  #   g:LspAddServer([{
  #     name: 'ty',
  #     filetype: ['python'],
  #     path: 'ty',
  #     args: ["server"],
  #     # features: {hover: false}
  #   }])
  # endif
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
  nnoremap <leader>wst <scriptcmd>vim9cmd fuzzy#WikiTags()<CR>
endif

if exists('g:loaded_taglist')
  g:Tlist_Enable_Fold_Column = 0
  g:Tlist_Use_Right_Window = 1
  g:Tlist_Compact_Format = 1
  nnoremap <leader>tl :TlistToggle<CR>
  nnoremap <leader>tc :TlistClose<CR>
  nnoremap [t <plug>(TlistJumpTagUp)
  nnoremap ]t <plug>(TlistJumpTagDown)
elseif exists('g:loaded_vista')
  nnoremap <leader>vt :Vista<CR>
  nnoremap <leader>vl :Vista yegappan_lsp<CR>
  nnoremap <leader>vc :Vista!<CR>
endif

if exists('g:loaded_mundo')
  nnoremap <leader>ut :MundoToggle<CR>
endif

if exists('g:loaded_vimcomplete')
  inoremap <C-u> <Plug>(vimcomplete-info-window-pageup)
  inoremap <C-f> <Plug>(vimcomplete-info-window-pagedown)
  var options = {
    completor: { shuffleEqualPriority: true, postfixHighlight: true },
    buffer: { enable: true, priority: 7, urlComplete: true, envComplete: true, maxCount: 5 },
    abbrev: { enable: false, priority: 5 },
    lsp: { enable: true, priority: 15, maxCount: 10 },
    omnifunc: { enable: true, priority: 8, filetypes: ['python', 'javascript', 'vim'], maxCount: 5 },
    vsnip: { enable: false, priority: 11, maxCount: 5 },
    vimscript: { enable: true, priority: 11, maxCount: 5 },
    ngram: {
      enable: true,
      priority: 10,
      bigram: false,
      filetypes: ['text', 'help', 'markdown'],
      filetypesComments: ['c', 'cpp', 'python', 'java', 'rust', 'vim'],
    },
    tag: { enable: true, maxCount: 5, priority: 9 },
  }
  g:VimCompleteOptionsSet(options)
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
