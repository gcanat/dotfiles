local function check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

local map = vim.keymap.set
-- keymaps
map('i', '<Tab>', function()
  if vim.fn.pumvisible() == 1 then
    return "<C-n>"
  elseif check_back_space() then
      return '<Tab>'
  else
    return "<C-x><C-o>"
  end
end, { expr = true })

map('i', '<S-Tab>', function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true })

-- snippets
map({ 'i', 's' }, '<C-l>', function()
    if vim.snippet.active({ direction = 1 }) then
      return '<Cmd>lua vim.snippet.jump(1)<CR>'
    else
      return '<C-l>'
    end
  end, { expr = true })
map({ 'i', 's' }, '<C-h>', function()
    if vim.snippet.active({ direction = -1 }) then
      return '<Cmd>lua vim.snippet.jump(-1)<CR>'
    else
      return '<C-h>'
    end
  end, { expr = true })

map("i", "kj", "<ESC>", { noremap = true, silent = true })
map('n', 'à', ']', { remap = true })
map('n', 'ç', '[', { remap = true })
map('n', 's', '<c-w>', { remap = true })
map('n', '\\h', ':noh<CR>', {noremap = true})
map('n', '<leader>tf', ':Floaterminal ')
map('n', '<localleader>dw', ':windo diffthis<CR>', { desc = 'Diff windows' })
map('n', '<leader>gw', '<Cmd>Grep <cword><CR>', {noremap = true, desc = 'Grep current word' })

-- fzf-lua mappings
map('n', '<leader>fe', '<Cmd>FzfLua files<CR>', { desc = 'Find files' })
map('n', '<leader>ge', '<Cmd>FzfLua git_files<CR>', { desc = 'Git files' })
map('n', '<leader>fm', '<Cmd>FzfLua oldfiles<CR>', { desc = 'Old files' })
map('n', '<leader>fg', '<Cmd>FzfLua live_grep_native<CR>', { desc = 'Live grep' })
map('n', '<leader>fr', '<Cmd>FzfLua resume<CR>', { desc = 'Fzf resume' })
map('n', '<leader>fk', '<Cmd>FzfLua keymaps<CR>', { desc = 'Fzf keymaps' })
map('n', '<leader>b', '<Cmd>FzfLua buffers<CR>', { desc = 'Find buffers' })
map('n', 'gs', '<Cmd>FzfLua lsp_document_symbols<CR>', { desc = 'Lsp doc symbols' })
map('n', '<localleader>gc', '<Cmd>lua require("fzf-lua").git_commits({fzf_opts = {["--no-sort"] = true}})<CR>', { desc = 'Git commits' })
map('n', '<localleader>gb', '<Cmd>FzfLua git_branches<CR>', { desc = 'Git branches' })
map('n', '<localleader>gt', '<Cmd>FzfLua git_tags<CR>', { desc = 'Git tags' })
map('n', '<localleader>gs', '<Cmd>FzfLua git_status<CR>', { desc = 'Git status' })
map('n', '<localleader>gw', '<Cmd>FzfLua git_worktrees<CR>', { desc = 'Git worktrees' })
map('n', '<localleader>gh', '<Cmd>FzfLua git_hunks<CR>', { desc = 'Git hunks' })


vim.api.nvim_create_user_command('Grep', function(opts)
  vim.api.nvim_command(string.format('cgetexpr system(&grepprg . " %s")', vim.fn.expand(opts.args)))
end, { nargs = '+' })

vim.api.nvim_create_user_command('Packup', function (_) vim.pack.update() end, { nargs = '*'})

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = { 'habamax', 'gruvbox*', 'wildcharm' },
  group = vim.api.nvim_create_augroup('ColorScheme', { clear = true}),
  command = 'hi Normal guibg=NONE ctermbg=NONE ctermfg=NONE guifg=NONE'
})

vim.api.nvim_create_autocmd('BufFilePost', {
  pattern = { 'guh://*/prdiff/*', 'guh://*/prcomments/*'},
  command = 'nnoremap <buffer> cd :.GuhComment!<CR>'
})
-- set custom syntax for guh summary
vim.api.nvim_create_autocmd('BufFilePost', {
  pattern = 'guh://*/*',
  callback = function(ev)
    for _, pat in pairs({ '/pr/', '/prdiff/', '/prcomments', '/commit/' }) do
      if ev.match:find(pat) then return end
    end
    vim.cmd([[set syntax=ghsummary]])
  end,
})

map("n", "<leader>u", function()
  require("undotree").open({ title = "undotree"})
end, { silent = true, desc = "Undotree toggle" })

vim.cmd([[
  function! s:git_merge_base() abort
    return FugitiveExecute(['merge-base', 'origin', 'HEAD']).stdout[0]
  endfunction

  nn <space>dm :Gvdiffsplit <C-r>=<SID>git_merge_base()<CR><CR>
  nn <space>gr :<C-u>Git difftool -y <C-r>=<SID>git_merge_base()<CR><CR>
]])
