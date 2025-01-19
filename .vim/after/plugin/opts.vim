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
    nnoremap <leader>fg <scriptcmd>fuzzy.Grep('rg -HS --no-heading --vimgrep -g "!*.ipynb" -g "!*.egg-info" -g "!*__pycache__*"')<CR>
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
  nnoremap <leader>b <scriptcmd>vim9cmd fuzzy#Buffer()<CR>
  nnoremap <leader>e <scriptcmd>vim9cmd fuzzy#File()<CR>
  nnoremap <leader>fe <scriptcmd>vim9cmd fuzzy#FileTree()<CR>
  nnoremap <leader>fg <scriptcmd>vim9cmd fuzzy#LiveGrep()<CR>
  nnoremap <leader>ge <scriptcmd>vim9cmd fuzzy#GitFile()<CR>
  nnoremap <leader>fm <scriptcmd>vim9cmd fuzzy#MRU()<CR>
  nnoremap <leader>dj <scriptcmd>vim9cmd fuzzy#DumbJump()<CR>
  nnoremap <leader>fs <scriptcmd>vim9cmd fuzzy#Session()<CR>
  nnoremap <leader>fp <scriptcmd>vim9cmd fuzzy#Project()<CR>
  nnoremap <leader>jl <scriptcmd>vim9cmd fuzzy#Jumplist()<CR>
  nnoremap <leader>ch <scriptcmd>vim9cmd fuzzy#CmdHistory()<CR>
  nnoremap <leader>wsf <scriptcmd>vim9cmd fuzzy#File('~/wiki')<CR>
endif

if exists("g:loaded_lsp")
  # g:LspOptionsSet({
  #   completionMatcher: 'fuzzy',
  #   completionTextEdit: false,
  #   showInlayHints: false,
  #   showDiagWithVirtualText: false,
  #   diagVirtualTextAlign: 'after',
  #   diagVirtualTextWrap: 'truncate',
  #   autoHighlightDiags: true,
  #   autoComplete: true,
  #   diagSignErrorText: 'E',
  #   diagSignInfoText: 'I',
  #   diagSignHintText: 'H',
  #   diagSignWarningText: 'W',
  #   useQuickfixForLocations: true,
  #   filterCompletionDuplicates: true,
  #   useBufferCompletion: true
  # })
  g:LspOptionsSet({
    condensedCompletionMenu: false,
    semanticHighlight: true,
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

   #  g:LspAddServer([{
   #   name: 'texlab',
   #   filetype: ['tex',, 'plaintex', 'bib'],
   #   path: exepath('texlab'),
   #   # args: ["-pdf", "-interaction=nonstopmode", "-synctex=1", "%f"],
   #   initializationOptions: {
   #     build: {
   #       onSave: true
   #     }
   #   }
   # }])
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

if executable('jupytext')
  g:jupytext_fmt = 'py:percent'
  packadd jupytext.vim
endif

if exists('g:wiki_loaded')
  g:wiki_root = '~/wiki'
  g:markdown_fenced_languages = ['python']
  nnoremap <leader>wst <scriptcmd>vim9cmd fuzzy#WikiTags()<CR>
endif

