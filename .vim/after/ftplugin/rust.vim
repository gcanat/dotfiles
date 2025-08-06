vim9script
g:termdebug_config['command'] = "rust-gdb"
b:undo_ftplugin ..= $' | exe "g:termdebugger = ""'
