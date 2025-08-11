func! fzy#ExitCb(ctx, job, status)
  if filereadable(a:ctx.fzy_selectfile)
    let selection = readfile(a:ctx.fzy_selectfile)
    if selection->len() > 0
      let win_num = winnr()
      call win_gotoid(a:ctx.win_id)
      execute ":" . win_num . "close"
      call a:ctx.selection_cb(selection[0], a:ctx.vim_cmd)
    endif
    call delete(fnameescape(a:ctx.fzy_selectfile))
  endif
  if filereadable(a:ctx.fzy_tmp_file)
    call delete(a:ctx.fzy_tmp_file)
  endif
endfunc

func! fzy#Select_cb(selection, vim_cmd)
    let parts = a:selection->split(":")
    if parts->len() > 1
      execute a:vim_cmd . " +" . parts[1] . " " . parts[0]
    else
      execute a:vim_cmd . " " . parts[0]
    endif
endfun

func! fzy#QfSelect_Cb(selection, vim_cmd)
  let qf_num = a:selection->split(":")[0]
  execute qf_num . "chist"
endfunc

func! fzy#Command(choice_command, vim_cmd, select_cb = "")
  let ctx = {"win_id": win_getid(), "fzy_selectfile": tempname(), "fzy_tmp_file": tempname(), "vim_cmd": a:vim_cmd}
  let ctx.selection_cb = a:select_cb == "" ? function("fzy#Select_cb") : function(a:select_cb)
  if type(a:choice_command) == v:t_list
    call writefile(a:choice_command, ctx.fzy_tmp_file)
    let cmd = "cat " . ctx.fzy_tmp_file . " | fzy > " . ctx.fzy_selectfile
  else
    let cmd = a:choice_command . " > " . ctx.fzy_selectfile
  endif
  let sh_cmd = [&shell, &shellcmdflag, cmd]
  botright let job = term_start(sh_cmd, {"term_rows": 11, "term_finish": "close", "exit_cb": function('fzy#ExitCb', [ctx]), "term_name": "fzy", "norestore": v:true})
endfunc

func! fzy#Mru()
  return v:oldfiles->copy()->filter({_, i -> i->fnamemodify(':p')->filereadable()})->map({_, i -> fnamemodify(i, ':~:.')})
endfunc

func! fzy#Buffers()
  return getbufinfo({'buflisted': 1})->mapnew({_, v -> bufname(v.bufnr) ?? $'[{v.bufnr}: No Name]'})
endfunc

func! fzy#QfHist()
  return execute("chist")->split("\n")->mapnew({i, v -> str2nr(i)+1 . ':' . v})
endfunc
