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
  var pattern = $'"{escape(join(args, ' '), '()[]*./-')}"'
  echom $'pattern: {pattern}'
  var buffers = getbufinfo({'buflisted': 1})->mapnew((_, v) => v.name)
  return system(join([&grepprg] + [pattern] + buffers, ' '))
enddef

def GrepCompleteBuffers(arglead: string, cmdline: string, cursorpos: number): list<any>
  var pattern = cmdline->substitute('Gbuf ', '', '')
  var buffers = getbufinfo({'buflisted': 1})->mapnew((_, v) => v.name)
  return arglead != null_string ? systemlist(join(['rg'] + ['-wIN'] + [$'"{pattern}"'] + buffers, ' ')) : []
enddef

command! -nargs=+ -complete=customlist,GrepCompleteBuffers Gbuf cgetexpr GrepBuffers(<f-args>)

if has('patch-9.1.1166')
  augroup cmdline
    autocmd!
    autocmd CmdlineEnter [:/\?] set pumheight=15
    autocmd CmdlineLeave [:/\?] set pumheight&
    autocmd CmdlineChanged [:/\?] wildtrigger()
  augroup END

  command! -nargs=+ -complete=customlist,GrepComplete LiveGrep VisitFile(<q-args>)

  def GrepComplete(arglead: string, cmdline: string, cursorpos: number): list<any>
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

  command! -nargs=+ -complete=custom,MruComplete MRU edit <args>

  def MruComplete(_, _, _): string
    return v:oldfiles->copy()->filter((_, i: string): bool => i->fnamemodify(':p')->filereadable())->map((_, i: string): string => fnamemodify(i, ':~:.'))->join("\n")
  enddef

  command! -nargs=+ -complete=custom,GitFilesComplete GE edit <args>

  def GitFilesComplete(_, _, _): string
    return system('git ls-files')
  enddef

endif
