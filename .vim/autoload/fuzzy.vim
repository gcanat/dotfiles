vim9script

import autoload 'popup.vim'
import autoload 'os.vim'

const MAX_ELEMENTS: number = 6000


export def Buffer()
    var buffer_list = getbufinfo({'buflisted': 1})->mapnew((_, v) => {
        return {bufnr: v.bufnr,
                text: (bufname(v.bufnr) ?? $'[{v.bufnr}: No Name]'),
                lastused: v.lastused,
                winid: len(v.windows) > 0 ? v.windows[0] : -1}
    })->sort((i, j) => i.lastused > j.lastused ? -1 : i.lastused == j.lastused ? 0 : 1)
    # Alternate buffer first, current buffer second
    if buffer_list->len() > 1 && buffer_list[0].bufnr == bufnr()
        [buffer_list[0], buffer_list[1]] = [buffer_list[1], buffer_list[0]]
    endif
    popup.FilterMenu("Buffers", buffer_list,
        (res, key) => {
            if key == "\<c-t>"
                exe $":tab sb {res.bufnr}"
            elseif key == "\<c-j>"
                exe $":sb {res.bufnr}"
            elseif key == "\<c-v>"
                exe $":vert sb {res.bufnr}"
            else
                if res.winid != -1
                    win_gotoid(res.winid)
                else
                    exe $":b {res.bufnr}"
                endif
            endif
        },
        (winid) => {
            win_execute(winid, "syn match FilterMenuDirectorySubtle '^.*[\\/]'")
            hi def link FilterMenuDirectorySubtle Comment
        })
enddef

export def MRU()
    var mru = []
    mru = v:oldfiles->filter((_, v) =>
        filereadable(fnamemodify(v, ":p")) &&
        v !~ '\~\\AppData\\Local\\Temp\\.*\.tmp' &&
        v !~ '.*\.\?\(vim\|vimfiles\)[/\\]pack[/\\].*doc[/\\].*\.txt' &&
        fnamemodify(v, ":p") !~ escape($VIMRUNTIME, '\')  .. '.*[/\\]doc[/\\].*\.txt'
    )
    popup.FilterMenu("MRU", mru,
        (res, key) => {
            if key == "\<c-t>"
                exe $":tabe {res.text->substitute('#', '\\&', 'g')}"
            elseif key == "\<c-j>"
                exe $":split {res.text->substitute('#', '\\&', 'g')}"
            elseif key == "\<c-v>"
                exe $":vert split {res.text->substitute('#', '\\&', 'g')}"
            else
                exe $":e {res.text->substitute('#', '\\&', 'g')}"
            endif
        },
        (winid) => {
            win_execute(winid, "syn match FilterMenuDirectorySubtle '^.*[\\/]'")
            hi def link FilterMenuDirectorySubtle Comment
        })
enddef

export def GitFile(path: string = "")
    var path_e = path->empty() ? "" : $"{path}/"
    var git_cmd = 'git ls-files --other --full-name --cached --exclude-standard'
    var cd_cmd = path->empty() ? "" : $"cd {path} && "
    var git_files = systemlist($'{cd_cmd}{git_cmd}')
    popup.FilterMenu("Git File", git_files,
        (res, key) => {
            if key == "\<c-t>"
                exe $":tabe {path_e}{res.text->substitute('#', '\\&', 'g')}"
            elseif key == "\<c-j>"
                exe $":split {path_e}{res.text->substitute('#', '\\&', 'g')}"
            elseif key == "\<c-v>"
                exe $":vert split {path_e}{res.text->substitute('#', '\\&', 'g')}"
            else
                exe $":e {path_e}{res.text->substitute('#', '\\&', 'g')}"
            endif
        },
        (winid) => {
            win_execute(winid, "syn match FilterMenuDirectorySubtle '^.*[\\/]'")
            hi def link FilterMenuDirectorySubtle Comment
        })
enddef

export def Colorscheme()
    popup.FilterMenu("Colorscheme",
        getcompletion("", "color"),
        (res, key) => {
            exe $":colorscheme {res.text}"
        },
        (winid) => {
            if exists("g:colors_name")
                win_execute(winid, $'syn match FilterMenuCurrent "^{g:colors_name}$"')
                hi def link FilterMenuCurrent Statement
            endif
        })
enddef

export def Template()
    var path = $"{fnamemodify($MYVIMRC, ':p:h')}/templates/"
    var ft = getbufvar(bufnr(), '&filetype')
    var ft_path = path .. ft
    var tmpls = []

    if !empty(ft) && isdirectory(ft_path)
        tmpls = mapnew(readdirex(ft_path, (e) => e.type == 'file'), (_, v) => $"{ft}/{v.name}")
    endif

    if isdirectory(path)
        extend(tmpls, mapnew(readdirex(path, (e) => e.type == 'file'), (_, v) => v.name))
    endif

    popup.FilterMenu("Template",
        tmpls,
        (res, key) => {
            append(line('.'), readfile($"{path}/{res.text}")->mapnew((_, v) => {
                return v->substitute('!!\(.\{-}\)!!', '\=eval(submatch(1))', 'g')
            }))
            if getline('.') =~ '^\s*$'
                del _
            else
                normal! j^
            endif
        })
enddef

export def Session()
    var sessions = glob($'{g:vimdata}/sessions/*', 1, 1)->map((_, v) => fnamemodify(v, ":t"))
    var idx = sessions->index('LAST')
    if idx > -1 && idx != 0
        sessions->remove(idx)
        sessions = ["LAST"] + sessions
    endif
    popup.FilterMenu("Session", sessions,
        (res, key) => {
            exe $':%%bd | source {g:vimdata}/sessions/{res.text}'
        })
enddef

export def Bookmark()
    var bookmarks = []
    if filereadable($'{g:vimdata}/bookmarks.json')
        bookmarks = readfile($'{g:vimdata}/bookmarks.json')
            ->join()
            ->json_decode()
            ->items()
            ->mapnew((_, v) => ({text: $"{v[0]} ({v[1].file})", file: v[1].file, line: v[1].line, col: v[1].col}))
            ->filter((_, v) => filereadable(v.file))
    endif
    popup.FilterMenu("Bookmark", bookmarks,
        (res, key) => {
            if key == "\<C-j>"
                exe $"split {res.file}"
            elseif key == "\<C-v>"
                exe $"vert split {res.file}"
            elseif key == "\<C-t>"
                exe $"tabe {res.file}"
            else
                exe $"confirm e {res.file}"
            endif
            exe $":{res.line}"
            exe $"normal! {res.col}|"
        },
        (winid) => {
            win_execute(winid, 'syn match FilterMenuDirectorySubtle "(.*)$"')
            hi def link FilterMenuDirectorySubtle Comment
        })
enddef

export def File(path: string = "")
    var sep = has("win32") ? '\' : '/'
    var opath = expand(path ?? "%:p:h")
    if !isdirectory(opath)
        opath = getcwd()
    endif
    var files = readdirex(opath, (d) => d.type =~ '\%(dir\|linkd\)$')->map((_, v) => {
                return {text: $"{v.name}{sep}", name: v.name, path: opath}
            }) + readdirex(opath, (d) => d.type =~ '\%(file\|link\)$')->map((_, v) => {
                return {text: v.name, name: v.name, path: opath}
            })
    if empty(files)
        files = [{text: "", name: "", path: opath}]
    endif

    popup.FilterMenu(pathshorten(opath), files, (res, key) => {
        var escpath = res.path->substitute('#', '\\&', 'g')
        var escname = res.name->substitute('#', '\\&', 'g')
        if (key == "\<bs>" || key == "\<c-h>") && isdirectory(fnamemodify(res.path, ':p:h:h'))
            File($"{fnamemodify(res.path, ':p:h:h')}")
        elseif key == "\<C-o>"
            os.Open($"{res.path}{sep}{res.name}")
        elseif isdirectory($"{res.path}{sep}{res.name}")
            File($"{res.path}{res.path[-1] == sep ? '' : sep}{res.name}")
        elseif key == "\<C-j>"
            exe $"split {escpath}{sep}{escname}"
        elseif key == "\<C-v>"
            exe $"vert split {escpath}{sep}{escname}"
        elseif key == "\<C-t>"
            exe $"tabe {escpath}{sep}{escname}"
        else
            exe $"confirm e {escpath}{sep}{escname}"
        endif
        }, (winid) => {
            win_execute(winid, $"syn match FilterMenuDirectory '^.*{sep->escape('\\')}'")
            hi def link FilterMenuDirectory Directory
        }, true)
enddef

export def FileTree(path: string = "")
    var opath = isdirectory(expand(path)) ? path : ''
    if opath == getcwd()
        opath = ''
    endif

    var files = []
    files = systemlist(g:findcmd)

    popup.FilterMenu("File", files[ : MAX_ELEMENTS - 1],
        (res, key) => {
            if key == "\<c-t>"
                exe $":tabe {res.text->substitute('#', '\\&', 'g')}"
            elseif key == "\<c-j>"
                exe $":split {res.text->substitute('#', '\\&', 'g')}"
            elseif key == "\<c-v>"
                exe $":vert split {res.text->substitute('#', '\\&', 'g')}"
            elseif key == "\<C-o>"
                os.Open($"{res.text}")
            else
                exe $":e {res.text->substitute('#', '\\&', 'g')}"
            endif
            var projects_file = $'{g:vimdata}/projects.json'
            var projects = []
            try
                if !filereadable(projects_file)
                    mkdir(fnamemodify(projects_file, ":p:h"), "p")
                else
                    projects = readfile(projects_file)->join()->json_decode()
                endif
                projects->add({path: fnamemodify(opath, ":p")
                    ->trim('\/', 2)})
                    ->sort()
                    ->uniq()
                    ->filter((_, v) => isdirectory(v.path))
                [projects->json_encode()]->writefile(projects_file)
            catch
                echohl Error
                echomsg v:exception
                echohl None
            endtry
        },
        (winid) => {
            win_execute(winid, "syn match FilterMenuDirectorySubtle '^.*[\\/]'")
            hi def link FilterMenuDirectorySubtle Comment
        })
enddef

export def LiveGrep(pattern: string = "")
    var matches = []
    if pattern != ""
        matches = systemlist($'{&grepprg} "' .. pattern .. '"')
    endif

    popup.FilterMenu("LiveGrep", matches[ : MAX_ELEMENTS - 1],
        (res, key) => {
            if key == "\<c-t>"
                exe $":tabe +{res.line} {res.file}"
            elseif key == "\<c-j>"
                exe $":split +{res.line} {res.file}"
            elseif key == "\<c-v>"
                exe $":vert split +{res.line} {res.file}"
            else
                exe $":e +{res.line} {res.file}"
            endif
        },
        (winid) => {
            if &grepprg[ : 2] == "rg "
              win_execute(winid, "syn match FilterMenuDirectorySubtle '^[^:]*:\\d\\+:\\d\\+:'")
            else
              win_execute(winid, "syn match FilterMenuDirectorySubtle '^[^:]*:\\d\\+:'")
            endif
            hi def link FilterMenuDirectorySubtle Comment
        },
        false,
        true
    )
enddef

export def Jumplist()
    var jumps = execute("jumps")->split("\n")[1 : ]
    var curr_idx = jumps->match('\v^\s*\>')

    popup.FilterMenu("Jumplist (jump line col file/text)", jumps->mapnew((_, v) => ({text: v})),
        (res, key) => {
              var idx = jumps->index(res.text)
              var delta = curr_idx - idx
              if delta > 0
                  exe $"normal! {delta}\<C-o>"
              else
                  exe $"normal! {abs(delta)}\<C-i>"
              endif
        },
        (winid) => {
            win_execute(winid, "syn match FilterMenuDirectorySubtle '^[^:]*:\\d\\+:\\d\\+:'")
            hi def link FilterMenuDirectorySubtle Comment
        },
        false,
        false
    )
enddef

export def Filetype()
    var ft_list = globpath(&rtp, "ftplugin/*.vim", 0, 1)
        ->mapnew((_, v) => ({text: fnamemodify(v, ":t:r")}))
        ->sort()
        ->uniq()
    popup.FilterMenu("Filetype", ft_list,
            (res, key) => {
                exe $":set ft={res.text}"
            })
enddef

export def Highlight()
    var hl = hlget()->mapnew((_, v) => {
        if v->has_key("cleared")
            return {text: $"xxx {v.name} cleared", name: v.name,
                    value: $"hi {v.name}"}
        elseif v->has_key("linksto")
            return {text: $"xxx {v.name} links to {v.linksto}", name: v.name,
                    value: $"hi link {v.name} {v.linksto}"}
        else
            var term = v->has_key('term') ? $' term={v.term->keys()->join(",")}' : ''
            var ctermfg = v->has_key('ctermfg') ? $' ctermfg={v.ctermfg}' : ''
            var ctermbg = v->has_key('ctermbg') ? $' ctermbg={v.ctermbg}' : ''
            var cterm = v->has_key('cterm') ? $' cterm={v.cterm->keys()->join(",")}' : ''
            var guifg = v->has_key('guifg') ? $' guifg={v.guifg}' : ''
            var guibg = v->has_key('guibg') ? $' guibg={v.guibg}' : ''
            var gui = v->has_key('gui') ? $' gui={v.gui->keys()->join(",")}' : ''
            return {text: $"xxx {v.name}{guifg}{guibg}{gui}{ctermfg}{ctermbg}{cterm}{term}",
                    name: v.name,
                    value: $"hi {v.name}{guifg}{guibg}{gui}{ctermfg}{ctermbg}{cterm}{term}"}
        endif
    })
    popup.FilterMenu("Highlight", hl,
        (res, key) => {
            feedkeys($":{res.value}\<C-f>")
        },
        (winid) => {
            win_execute(winid, 'syn match FilterMenuHiLinksTo "\(links to\)\|\(cleared\)"')
            hi def link FilterMenuHiLinksTo Comment
            for h in hl
                win_execute(winid, $'syn match {h.name} "^xxx\ze {h.name}\>"')
            endfor
        })
enddef

export def Help()
    var help_tags = globpath(&rtp, "doc/tags", 1, 1)
        ->mapnew((_, v) => readfile(v)->mapnew((_, line) => ({text: line->split("\t")[0]})))
        ->flattennew()
    popup.FilterMenu("Help", help_tags,
        (res, key) => {
            if key == "\<c-t>"
                exe $":tab help {res.text}"
            elseif key == "\<c-v>"
                exe $":vert help {res.text}"
            else
                exe $":help {res.text}"
            endif
        })
enddef

export def CmdHistory()
    var cmd_history = [{text: histget("cmd")}] + range(1, histnr("cmd"))->mapnew((i, _) => {
        return {text: histget("cmd", i), idx: i}
    })->filter((_, v) => v.text !~ "^\s*$")->sort((el1, el2) => el1.idx == el2.idx ? 0 : el1.idx > el2.idx ? -1 : 1)
    popup.FilterMenu("Command History", cmd_history,
        (res, key) => {
            if key == "\<c-j>"
                feedkeys($":{res.text}\<C-f>", "n")
            else
                feedkeys($":{res.text}\<CR>", "nt")
            endif
        })
enddef

export def Project()
    var projects = []
    var projects_file = $'{g:vimdata}/projects.json'
    if filereadable(projects_file)
        try
            projects = readfile(projects_file)
                ->join()
                ->json_decode()
                ->mapnew((_, v) => ({text: v.path}))
                ->filter((_, v) => isdirectory(v.text))
        catch
            return
        endtry
    endif
    popup.FilterMenu("Project", projects,
        (res, key) => {
            FileTree(res.text)
        },
        (winid) => {
            win_execute(winid, "syn match FilterMenuDirectorySubtle '^.*[\\/]'")
            hi def link FilterMenuDirectorySubtle Comment
        })
enddef

export def DumbJump()
    var word = expand("<cword>")
    if empty(trim(word)) | return | endif
    var lines = []
    for nr in range(1, line('$'))
        var line = getline(nr)
        if line->stridx(word) > -1
            lines->add({text: $"{line} ({nr})", linenr: nr})
        endif
    endfor
    popup.FilterMenu($'Jump with "{word}"', lines,
        (res, key) => {
            exe $":{res.linenr}"
            normal! zz
        },
        (winid) => {
            win_execute(winid, 'syn match FilterMenuLineNr "(\d\+)$"')
            hi def link FilterMenuLineNr Comment
        })
enddef

export def Window()
    var windows = []
    for w_info in getwininfo()
        var tabtext = tabpagenr('$') > 1 ? $"Tab {w_info.tabnr}, " : ""
        var wintext = $"Win {w_info.winnr}"
        var name = empty(bufname(w_info.bufnr)) ? "[No Name]" : bufname(w_info.bufnr)
        var current_sign = w_info.winid == win_getid() ? "*" : " "
        windows->add({text: $"{current_sign}({tabtext}{wintext}): {name} ({w_info.winid})", winid: w_info.winid})
    endfor
    popup.FilterMenu($'Jump window', windows,
        (res, key) => {
            win_gotoid(res.winid)
        },
        (winid) => {
            win_execute(winid, 'syn match FilterMenuRegular "^ (.\{-}):.*(\d\+)$" contains=FilterMenuBraces')
            win_execute(winid, 'syn match FilterMenuCurrent "^\*(.\{-}):.*(\d\+)$" contains=FilterMenuBraces')
            win_execute(winid, 'syn match FilterMenuBraces "(\d\+)$" contained')
            win_execute(winid, 'syn match FilterMenuBraces "^[* ](.\{-}):" contained')
            hi def link FilterMenuBraces Comment
            hi def link FilterMenuCurrent Statement
        })
enddef


export def WikiTags()
    var sep = has("win32") ? '\' : '/'
    var wiki_tags = wiki#tags#get_all()
    var root_path = wiki#get_root()
    var tag_list: list<dict<any>> = []
    for [tag, locations] in items(wiki_tags)
        for loc in locations
          add(tag_list, {text: $'{tag}:{loc[0]}:{loc[1]}', name: $'{loc[0]}', path: $'{root_path}', line_num: $'{loc[1]}'})
        endfor
    endfor
    popup.FilterMenu('Wiki Tags', tag_list,
        (res, key) => {
        var escpath = res.path->substitute('#', '\\&', 'g')
        var escname = res.name->substitute('#', '\\&', 'g')
        if (key == "\<bs>" || key == "\<c-h>") && isdirectory(fnamemodify(res.path, ':p:h:h'))
            File($"{fnamemodify(res.path, ':p:h:h')}")
        elseif key == "\<C-o>"
            os.Open($"{res.name}")
        elseif isdirectory($"{res.path}{sep}{res.name}")
            File($"{res.path}{res.path[-1] == sep ? '' : sep}{res.name}")
        elseif key == "\<C-j>"
            exe $"split +{res.line_num} {escname}"
        elseif key == "\<C-v>"
            exe $"vert split +{res.line_num} {escname}"
        elseif key == "\<C-t>"
            exe $"tabe +{res.line_num} {escname}"
        else
          exe $"confirm e +{res.line_num} {escname}"
        endif
        }, (winid) => {
            win_execute(winid, $"syn match FilterMenuDirectory '^.*{sep->escape('\\')}'")
            hi def link FilterMenuDirectory Directory
        }, true)
enddef
