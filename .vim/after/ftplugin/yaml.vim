vim9script

if !executable('yamllint')
  finish
endif

setl efm=%f:%l:%c:\ %m

augroup YAMLquickfix
    autocmd!
    autocmd BufWritePost *.yaml,*.yml cgetexpr systemlist('yamllint --f parsable ' .. expand('%'))
augroup END

b:undo_ftplugin ..= ' | setl errorformat<'
