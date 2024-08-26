vim9script

setl formatlistpat=\\s*\\\\item\\s\\+

b:tex_flavor = 'latex'
compiler tex
setl makeprg=max_print_line=10000\ latexmk\ -pdflatex\ -f\ -file-line-error\ -interaction=nonstopmode
set efm=%f:%l:\ LaTeX\ Error:\ %m,%-G%.%#
# set efm+=%Z\ 
# set efm+=%C%.%#
# set efm+=%C\ %m

# set efm=%W%f:%l:\ LaTeX\ Warning:\ %m
# set efm+=%Z\ 
# set efm+=%C%.%#
# set efm+=%C%m

# g:old_efm = &errorformat

# set efm=%E%f:%l:\ LaTeX\ Error:\ %m,
#   \%E%f:%l:!\ %m,
#   \%+W%f:%l:LaTeX\ %.%#Warning:\ %m,
#   \%+W%.%#\ at\ lines\ %l--%*\\d,
#   \%W%f:%l:LaTeX\ %.%#Warning:\ %m,
#   \%Cl.%l\ %m,
#   \%+C\ \ %m.,
#   \%+C%.%#-%.%#,
#   \%+C%.%#[]%.%#,
#   \%+C[]%.%#,
#   \%+C%.%#%[{}\\]%.%#,
#   \%+C<%.%#>%.%#,
#   \%C\ \ %m,
#   \%-GSee\ the\ LaTeX%m,
#   \%-GType\ \ H\ <return>%m,
#   \%-G\ ...%.%#,
#   \%-G%.%#\ (C)\ %.%#,
#   \%-G(see\ the\ transcript%.%#),
#   \%-G\\s%#,
#   \%+O(%f)%r,
#   \%+P(%f%r,
#   \%+P\ %\\=(%f%r,
#   \%+P%*[^()](%f%r,
#   \%+P[%\\d%[^()]%#(%f%r,
#   \%+Q)%r,
#   \%+Q%*[^()])%r,
#   \%+Q[%\\d%*[^()])%r


def TexComp(): string
  var cmd = &makeprg .. " " .. expand('%:t')
  return system(cmd)
enddef

command! -nargs=0 -bar TexComp cgetexpr TexComp()

augroup texcmp | au!
  au BufWritePost *.tex cgetexpr TexComp()
augroup END

b:undo_ftplugin ..= ' | setl formatlistpat< makeprg< errorformat<' # | set errorformat=' .. g:old_efm
