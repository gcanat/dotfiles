vim9script
# source https://github.com/habamax/.vim/blob/master/autoload/popup.vim

var borderchars     = ['─', '│', '─', '│', '╭', '╮', '╯', '╰']
# var borderchars     = ['─', '│', '─', '│', '┌', '┐', '┘', '└']
var bordertitle     = ['─┐', '┌']
var borderhighlight = []
var popuphighlight  = get(g:, "popuphighlight", '')

# Returns winnr of created popup window
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

# Popup menu with fuzzy filtering
# Example usage 1:
# FilterMenu("Echo Text",
#            ["He was aware there were numerous wonders of this world including the",
#             "unexplained creations of humankind that showed the wonder of our",
#             "ingenuity. There are huge heads on Easter Island. There are the",
#             "Egyptian pyramids. There's Stonehenge. But he now stood in front of a",
#             "newly discovered monument that simply didn't make any sense and he",
#             "wondered how he was ever going to be able to explain it.",
#             "The wave crashed and hit the sandcastle head-on. The sandcastle began",
#             "to melt under the waves force and as the wave receded, half the",
#             "sandcastle was gone. The next wave hit, not quite as strong, but still",
#             "managed to cover the remains of the sandcastle and take more of it",
#             "away. The third wave, a big one, crashed over the sandcastle completely",
#             "covering and engulfing it. When it receded, there was no trace the",
#             "sandcastle ever existed and hours of hard work disappeared forever." ],
#            (res, key) => {
#               echo res
#            })
# Example usage 2:
# FilterMenu("Buffers",
#         getbufinfo({'buflisted': 1})->mapnew((_, v) => {
#                 return {bufnr: v.bufnr, text: (v.name ?? $'[{v.bufnr}: No Name]')}
#             }),
#         (res, key) => {
#             if key == "\<c-t>"
#                 exe $":tab sb {res.bufnr}"
#             elseif key == "\<c-j>"
#                 exe $":sb {res.bufnr}"
#             elseif key == "\<c-v>"
#                 exe $":vert sb {res.bufnr}"
#             else
#                 exe $":b {res.bufnr}"
#             endif
#         })
export def FilterMenu(title: string, items: list<any>, Callback: func(any, string), Setup: func(number) = null_function, close_on_bs: bool = false, live_grep: bool = false)
    if empty(prop_type_get('FilterMenuMatch'))
        hi def link FilterMenuMatch Constant
        prop_type_add('FilterMenuMatch', {highlight: "FilterMenuMatch", override: true, priority: 1000, combine: true})
    endif
    var prompt = ""
    var items_dict: list<dict<any>>
    var items_count = items->len()
    if items_count < 1
        items_dict = [{text: ""}]
    elseif items[0]->type() != v:t_dict
        items_dict = items->mapnew((_, v) => {
            return {text: v}
        })
    else
        items_dict = items
    endif

    var filtered_items: list<any> = [items_dict]

    def Printify(itemsAny: list<any>, props: list<any>): list<any>
        if itemsAny[0]->len() == 0 | return [] | endif
        if itemsAny->len() > 1
            return itemsAny[0]->mapnew((idx, v) => {
                if has_key(v, "file")
                    return { text: v.text, line: v.line, file: v.file, props: itemsAny[1][idx]->mapnew((_, c) => { 
                        var col_index = v.file->len() + v.line->len() + v.col->len() + 3 + c
                        return { col: col_index, length: v.prompt_len, type: 'FilterMenuMatch'}
                    })}
                else
                    return { text: v.text, props: itemsAny[1][idx]->mapnew((_, c) => {
                        return { col: v.text->byteidx(c) + 1, length: 1, type: 'FilterMenuMatch' }
                    })}
                endif
            })
        else
            return itemsAny[0]->mapnew((_, v) => {
                if has_key(v, "file")
                  return {text: v.text, file: v.file, line: v.line}
                else
                  return {text: v.text}
                endif
            })
        endif
    enddef

    var min_height = 5
    if items->len() < 1
      min_height = (&lines * 0.6)->float2nr()
    endif
    var height = min([&lines - 6, max([items->len(), min_height])])
    var minwidth = (&columns * 0.6)->float2nr()
    var pos_top = ((&lines - height) / 2) - 1
    var ignore_input = ["\<cursorhold>", "\<ignore>", "\<Nul>",
          \ "\<LeftMouse>", "\<LeftRelease>", "\<LeftDrag>", $"\<2-LeftMouse>",
          \ "\<RightMouse>", "\<RightRelease>", "\<RightDrag>", "\<2-RightMouse>",
          \ "\<MiddleMouse>", "\<MiddleRelease>", "\<MiddleDrag>", "\<2-MiddleMouse>",
          \ "\<MiddleMouse>", "\<MiddleRelease>", "\<MiddleDrag>", "\<2-MiddleMouse>",
          \ "\<X1Mouse>", "\<X1Release>", "\<X1Drag>", "\<X2Mouse>", "\<X2Release>", "\<X2Drag>",
          \ "\<ScrollWheelLeft", "\<ScrollWheelRight>"
    ]
    # this sequence of bytes are generated when left/right mouse is pressed and
    # mouse wheel is rolled
    var ignore_input_wtf = [128, 253, 100]
    var winid = popup_create(Printify(filtered_items, []), {
        title: $" ({items_count}/{items_count}) {title} {bordertitle[0]}  {bordertitle[1]}",
        line: pos_top,
        minwidth: minwidth,
        maxwidth: (&columns - 5),
        minheight: height,
        maxheight: height,
        border: [],
        borderchars: borderchars,
        borderhighlight: borderhighlight,
        highlight: popuphighlight,
        drag: 0,
        wrap: 1,
        cursorline: false,
        padding: [0, 1, 0, 1],
        mapping: 0,
        filter: (id, key) => {
            var new_minwidth = popup_getpos(id).core_width
            if new_minwidth > minwidth
                minwidth = new_minwidth
                popup_move(id, {minwidth: minwidth})
            endif
            if key == "\<esc>"
                popup_close(id, -1)
            elseif key == "\<M-q>"
                # build the list of items for the quickfix list
                var qf_items = filtered_items[0]->mapnew((_, v) => {
                    return {filename: v.file, lnum: char2nr(v.line), col: char2nr(v.col), text: v.line_txt}
                })
                setqflist([], ' ', {'items': qf_items, 'nr': '$', 'title': 'LiveGrep'})
                exe $":copen"
                popup_close(id, -1)
            elseif ["\<cr>", "\<C-j>", "\<C-v>", "\<C-t>", "\<C-o>"]->index(key) > -1
                    && filtered_items[0]->len() > 0 && items_count > 0
                popup_close(id, {idx: getcurpos(id)[1], key: key})
            elseif key == "\<Right>"
                win_execute(id, 'normal! ' .. "\<C-d>")
            elseif key == "\<Left>"
                win_execute(id, 'normal! ' .. "\<C-u>")
            elseif key == "\<tab>" || key == "\<C-n>" || key == "\<Down>" || key == "\<ScrollWheelDown>"
                var ln = getcurpos(id)[1]
                win_execute(id, "normal! j")
                if ln == getcurpos(id)[1]
                    win_execute(id, "normal! gg")
                endif
            elseif key == "\<S-tab>" || key == "\<C-p>" || key == "\<Up>" || key == "\<ScrollWheelUp>"
                var ln = getcurpos(id)[1]
                win_execute(id, "normal! k")
                if ln == getcurpos(id)[1]
                    win_execute(id, "normal! G")
                endif
            # Ignoring fancy events and double clicks, which are 6 char long: `<80><fc> <80><fd>.`
            elseif ignore_input->index(key) == -1 && strcharlen(key) != 6 && str2list(key) != ignore_input_wtf
                if key == "\<C-U>"
                    prompt = ""
                    filtered_items = [items_dict]
                elseif (key == "\<C-h>" || key == "\<bs>")
                    if empty(prompt) && close_on_bs
                        popup_close(id, {idx: getcurpos(id)[1], key: key})
                        return true
                    endif
                    prompt = prompt->strcharpart(0, prompt->strchars() - 1)
                    if empty(prompt)
                        filtered_items = [items_dict]
                    elseif !live_grep
                        filtered_items = items_dict->matchfuzzypos(prompt, {key: "text"})
                    # dont launch live grep with less than 4 chars
                    elseif prompt->len() > 3
                        var new_matches = systemlist('rg --no-heading --smart-case --column "' .. prompt .. '"')
                        var string_matches = new_matches->mapnew((_, v) => {
                            var splitted_text = split(v, ":")
                            return {text: v, file: splitted_text[0], line: splitted_text[1], col: splitted_text[2], line_txt: splitted_text[3], prompt_len: prompt->len()}
                        })
                        var pos_list = string_matches->mapnew((_, v) => {
                            return [str2nr(v.col)]
                            })
                        filtered_items = [string_matches, pos_list]
                        items_count = string_matches->len()
                    endif
                elseif key =~ '\p'
                    prompt ..= key
                    if !live_grep
                        filtered_items = items_dict->matchfuzzypos(prompt, {key: "text"})
                    # dont launch live grep with less than 4 chars
                    elseif prompt->len() > 3 
                        var new_matches = systemlist('rg --no-heading --smart-case --column "' .. prompt .. '"')
                        var string_matches = new_matches->mapnew((_, v) => {
                            var splitted_text = split(v, ":")
                            return {text: v, file: splitted_text[0], line: splitted_text[1], col: splitted_text[2], line_txt: splitted_text[3], prompt_len: prompt->len()}
                        })
                        var pos_list = string_matches->mapnew((_, v) => {
                          return [str2nr(v.col)]
                          })
                        filtered_items = [string_matches, pos_list]
                        items_count = string_matches->len()
                    endif
                endif
                popup_setoptions(id, {title: $" ({items_count > 0 ? filtered_items[0]->len() : 0}/{items_count}) {title} {bordertitle[0]} {prompt} {bordertitle[1]}" })
                popup_settext(id, Printify(filtered_items, []))
            endif
            return true
        },
        callback: (id, result) => {
                if result->type() == v:t_number
                    if result > 0
                        Callback(filtered_items[0][result - 1], "")
                    endif
                else
                    Callback(filtered_items[0][result.idx - 1], result.key)
                endif
            }
        })

    win_execute(winid, "setl nu cursorline cursorlineopt=both")
    if Setup != null_function
        Setup(winid)
    endif
enddef
