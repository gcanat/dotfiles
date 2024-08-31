vim9script

setl formatlistpat=\\s*\\\\item\\s\\+
setl textwidth=80
setl colorcolumn=+1

b:tex_flavor = 'latex'
compiler tex
setl makeprg=max_print_line=10000\ latexmk\ -pdflatex\ -f\ -file-line-error\ -interaction=nonstopmode\ -shell-escape
set efm=%f:%l:\ LaTeX\ Error:\ %m,%-G%.%#

def TexComp(): string
  var cmd = &makeprg .. " " .. expand('%:t')
  return system(cmd)
enddef

command! -nargs=0 -bar TexComp cgetexpr TexComp()

augroup texcmp | au!
  au BufWritePost *.tex cgetexpr TexComp()
augroup END

b:undo_ftplugin ..= ' | setl formatlistpat< textwidth< colorcolumn< makeprg< errorformat<'
