	vim9script
	import autoload 'dist/json.vim'
	setl formatexpr=json.FormatExpr()
  b:undo_ftplugin ..= 'setl formatexpr<'
