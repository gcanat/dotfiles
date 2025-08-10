func! fzy#ExitCb(ctx, job, status)
  if filereadable(a:ctx.fzy_selectfile)
    let selection = readfile(a:ctx.fzy_selectfile)
    if selection->len() > 0
      let win_num = winnr()
      call win_gotoid(a:ctx.win_id)
      execute ":" . win_num . "close"
      let parts = selection[0]->split(":")
      if parts->len() > 1
        execute a:ctx.vim_cmd . " +" . parts[1] . " " . parts[0]
      else
        execute a:ctx.vim_cmd . " " . parts[0]
      endif
    endif
    call delete(fnameescape(a:ctx.fzy_selectfile))
  endif
  if filereadable(a:ctx.fzy_tmp_file)
    call delete(a:ctx.fzy_tmp_file)
  endif
endfunc

func! fzy#Command(choice_command, vim_cmd, is_custom_cmd = v:false)
  let ctx = {"win_id": win_getid(), "fzy_selectfile": tempname(), "fzy_tmp_file": tempname(), "vim_cmd": a:vim_cmd}
  if a:is_custom_cmd
    let cmd = a:choice_command
  elseif type(a:choice_command) == v:t_list
    call writefile(a:choice_command, ctx.fzy_tmp_file)
    let cmd = "cat " . ctx.fzy_tmp_file . " | fzy > " . ctx.fzy_selectfile
  else
    let cmd = a:choice_command . " | fzy > " . ctx.fzy_selectfile
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
