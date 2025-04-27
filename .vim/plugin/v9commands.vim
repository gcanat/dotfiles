vim9script

# update packages
import autoload "git.vim"
command! PackUp git.PackUpdate()

# save and load sessions
if !isdirectory($'{g:vimdata}/sessions') | mkdir($'{g:vimdata}/sessions', "p") | endif
command! -nargs=1 -complete=custom,SessionComplete SaveSession :exe $'mksession! {g:vimdata}/sessions/<args>'
command! -nargs=1 -complete=custom,SessionComplete LoadSession :%bd <bar> exe $'so {g:vimdata}/sessions/<args>'
def SessionComplete(_, _, _): string
    return globpath($'{g:vimdata}/sessions/', "*", 0, 1)->mapnew((_, v) => fnamemodify(v, ":t"))->join("\n")
enddef

# Grep in the currently opened buffers
def GrepBuffers(...args: list<string>): string
  var pattern = $'"{join(args, " ")}"'
  var buffers = getbufinfo({'buflisted': 1})->mapnew((_, v) => v.name)
  return system(join([&grepprg] + [pattern] + buffers, ' '))
enddef

command! -nargs=+ -complete=custom,GrepBuffers Gbuf cgetexpr GrepBuffers(<f-args>)

if has('patch-9.1.1166')
  autocmd CmdlineChanged : timer_start(200, function(CmdComplete, [getcmdline()]))

  def CmdComplete(cur_cmdline: string, timer: number)
    var [cmdline, curpos] = [getcmdline(), getcmdpos()]
    if cur_cmdline ==# cmdline # Avoid completing each char of keymaps and pasted text
      && !pumvisible() && curpos == cmdline->len() + 1
      && cmdline =~ '\%(\w\|[*/:]\)$' && cmdline !~ '^\d\+$'  # Reduce noise
      feedkeys("\<C-@>", "ti")
      set eventignore+=CmdlineChanged  # Suppress redundant completion attempts
      timer_start(0, (_) => {
        getcmdline()->substitute('\%x00', '', 'g')->setcmdline()  # Remove <C-@> if no completion items exist
        set eventignore-=CmdlineChanged
        })
    endif
  enddef

  autocmd CmdlineEnter : set bo+=error
  autocmd CmdlineLeave : set bo-=error

  def MuteEventAndSend(key: string): string
      set ei+=CmdlineChanged
      timer_start(0, (_) => execute('set ei-=CmdlineChanged'))
      return (pumvisible() ? "\<c-e>" : "") .. key
  enddef
  cnoremap <expr> <up> MuteEventAndSend("\<up>")
  cnoremap <expr> <down> MuteEventAndSend("\<down>")
  cnoremap <Tab> <C-n>
  cnoremap <S-Tab> <C-p>
  nnoremap <leader>b :b·

  command! -nargs=+ -complete=customlist,GrepComplete LiveGrep VisitFile(<q-args>)
  def GrepComplete(arglead: string, cmdline: string, cursorpos: number): list<any>
      # return arglead != null_string ? systemlist($'grep -REIHns "{arglead}"' ..
      #    ' --exclude-dir=.git --exclude=".*"') : []
      return arglead != null_string ? systemlist($'{&grepprg} {arglead}') : []
  enddef
  def VisitFile(line: string)
      var qfitem = getqflist({lines: [line]}).items[0]
      if qfitem->has_key('bufnr')
          var pos = qfitem.vcol > 0 ? 'setcharpos' : 'setpos'
          exec $':b +call\ {pos}(".",\ [0,\ {qfitem.lnum},\ {qfitem.col},\ 0]) {qfitem.bufnr}'
          setbufvar(qfitem.bufnr, '&buflisted', 1)
      endif
  enddef

endif
