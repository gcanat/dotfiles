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
  
