vim9script

# import autoload 'term.vim'
# xnoremap <expr> <space>t term.Send()
# nnoremap <expr> <space>t term.Send()
# nnoremap <expr> <space>tt term.Send() .. '_'
export def Send(...args: list<any>): string
    if len(args) == 0
        &opfunc = matchstr(expand('<stack>'), '[^. ]*\ze[')
        return 'g@'
    endif

    var terms = getwininfo()->filter((_, v) => getbufvar(v.bufnr, '&buftype') == 'terminal')
    if len(terms) < 1
        echomsg "There is no visible terminal!"
        return ""
    endif

    if len(terms) > 1
        echomsg "Too many terminals open!"
        return ""
    endif

    var term_window = terms[0].winnr

    var sel_save = &selection
    &selection = "inclusive"
    var reg_save = getreg('"')
    var clipboard_save = &clipboard
    &clipboard = ""

    var commands = {"line": "'[V']y", "char": "`[v`]y", "block": "`[\<c-v>`]y"}
    silent exe 'noautocmd keepjumps normal! ' .. get(commands, args[0], '')

    var text = split(@", "\n")
    if len(text) > 0 && text[-1] =~ '^\s\+'
        text[-1] ..= "\r"
    endif
    term_sendkeys(winbufnr(term_window), "\<F6>" .. text->join("\r") .. "\r\<F6>\r")

    &selection = sel_save
    setreg('"', reg_save)
    &clipboard = clipboard_save
    return ""
enddef

# Callback to use after the popup is closed
def MyHandler(bufno: number, timer: number)
  # delete the buffer forcefully
  :exe $'bw! {bufno}'
  # remove link to Pmenu
  hi link Terminal NONE
enddef

# Open a terminal popup and run the cmd
export def TermPopup(cmd: list<string>): void
  hi link Terminal Pmenu
  var cols = (&columns * 0.8) ->float2nr()
  var lines = (&lines * 0.7)->float2nr()
  var term_opts = {
    hidden: 1,
    term_cols: cols,
    norestore: 1,
  }
  var buf = term_start(cmd, term_opts)

  var winid = popup_create(buf, {
    minwidth: cols,
    minheight: lines,
    maxwidth: cols,
    callback: (id, res) => {
      # wait 100ms before deleting the terminal buffer
      timer_start(100, function('MyHandler', [buf]))
    },
  })

enddef
