vim9script

# var borderchars     = ['─', '│', '─', '│', '┌', '┐', '┘', '└']
# var bordercharsp    = ['─', '│', '─', '│', '┌', '┐', '┤', '├']
var borderchars = ['─', '│', '─', '│', '╭', '╮', '╯', '╰']
var bordercharsp = ['─', '│', '─', '│', '╭', '╮', '┤', '├']
var bordertitle     = ['─┐', '┌']
var borderhighlight = []
var popuphighlight  = get(g:, "popuphighlight", 'Normal')
var popupcursor = '█'

# Returns winnr of created popup window
# copied from https://github.com/habamax/.vim/blob/92450104ac6f1f0ae20c3a80c299dafd36f0b24b/autoload/popup.vim#L94
export def ShowAtCursor(text: any, Setup: func(number) = null_function): number
  var new_text = text
  if text->type() == v:t_string
    new_text = text->trim("\<CR>")
  else
    new_text = text->mapnew((_, v) => v->trim("\<CR>"))
  endif
  var winid = popup_atcursor(new_text, {
    padding: [0, 1, 0, 1],
    border: [],
    borderchars: borderchars,
    borderhighlight: borderhighlight,
    highlight: popuphighlight,
    pos: "botleft",
    mapping: 0,
    filter: (winid, key) => {
      if key == "\<Space>"
        win_execute(winid, "normal! \<C-d>\<C-d>")
        return true
      elseif key == "j"
        win_execute(winid, "normal! \<C-d>")
        return true
      elseif key == "k"
        win_execute(winid, "normal! \<C-u>")
        return true
      elseif key == "g"
        win_execute(winid, "normal! gg")
        return true
      elseif key == "G"
        win_execute(winid, "normal! G")
        return true
      endif
      if key == "\<ESC>"
        popup_close(winid)
        return true
      endif
      return true
    }
  })
  if Setup != null_function
    Setup(winid)
  endif
  return winid
enddef
