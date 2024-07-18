vim9script
if executable('stylua')
  setl formatprg=stylua\ -
  setl formatexpr=
endif
b:undo_ftplugin ..= ' | setl formatprg<'
