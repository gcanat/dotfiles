-- aliases
local map = vim.keymap.set -- alias to easier keymapping
-- Mappings.
-- Y yank until the end of line
map("n", "Y", "y$", { noremap = true, desc = 'Yank until end of line' })

map("v", "<leader>o", ":OSCYank<CR>", {noremap = true, desc= 'Copy to clipboard'})

-- completion shortcuts
-- map('i', [[<Tab>]], [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { noremap = true, expr = true })
-- map('i', [[<S-Tab>]], [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })

-- Telescope shortcuts
-- map("n", "<leader><space>", [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true , desc = 'Telescope buffers'})
-- map("n", "<leader>ff", [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true, desc = 'Telescope find files' })
-- map(
--   "n",
--   "<leader>fb",
--   [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
--   { noremap = true, silent = true , desc ='Telescope fuzzy find'}
-- )
-- map("n", "<leader>fh", [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true , desc ='Telescope help tags'})
-- map("n", "<leader>ft", [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true, desc = 'Telescope tags' })
-- map("n", "<leader>fd", [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true , desc = 'Telescope grep strings'})
-- map("n", "<leader>fp", [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true , desc = 'Telescope live grep'})
-- map(
--   "n",
--   "<leader>fo",
--   [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
--   { noremap = true, silent = true , desc ='Telescope tags current buffer'}
-- )
-- map("n", "<leader>?", [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true , desc = 'Telescope oldfiles'})
--
-- -- Telescope github shortcuts
-- map("n", "<leader>gc", ":Telescope git_commits<CR>", { noremap = true, silent = true , desc = 'Git commits'})
-- map("n", "<leader>gs", ":Telescope git_status<CR>", { noremap = true, silent = true , desc = 'Git status'})
-- map("n", "<leader>gb", ":Telescope git_branches<CR>", { noremap = true, silent = true , desc = 'Git branches'})
map("n", "<leader>gi", ":Telescope gh issues<CR>", { noremap = true, silent = true , desc = 'Git issues'})
map("n", "<leader>gp", ":Telescope gh pull_request<CR>", { noremap = true, silent = true , desc = 'Git pull requests'})

-- FzfLua keymaps
map("n", "<leader>ff", ":FzfLua files<CR>", { noremap = true, silent = true, desc = 'Find Files'})
map("n", "<leader>fb", ":FzfLua buffers<CR>", { noremap = true, silent = true, desc = 'Find Buffers'})
map("n", "<leader>fh", ":FzfLua help_tags<CR>", { noremap = true, silent = true, desc = 'Find Help Tags'})
map("n", "<leader>ft", ":FzfLua tags<CR>", { noremap = true, silent = true, desc = 'Find Tags'})
map("n", "<leader>fd", ":FzfLua grep_strings<CR>", { noremap = true, silent = true, desc = 'Find grep strings'})
map("n", "<leader>fp", ":FzfLua live_grep<CR>", { noremap = true, silent = true, desc = 'Find live grep'})
map("n", "<leader>fo", ":FzfLua oldfiles<CR>", { noremap = true, silent = true, desc = 'Find oldfiles'})

map("n", "<leader>gc", ":FzfLua git_commits<CR>", {noremap = true, silent = true, desc = 'Git commits'})
map("n", "<leader>gs", ":FzfLua git_status<CR>", {noremap = true, silent = true, desc = 'Git status'})
map("n", "<leader>gb", ":FzfLua git_branches<CR>", {noremap = true, silent = true, desc = 'Git branches'})
map("n", "<leader>gi", ":FzfLua gh issues<CR>", {noremap = true, silent = true, desc = 'Git issues'})
-- map("n", "<leader>gp", ":FzfLua gh pull_request<CR>", {noremap = true, silent = true, desc = 'Git pull requests'})
-- map("n", "<leader>gp", [[<cmd>lua require'fzf-lua'.fzf_exec("gh pr list --limit 300", { actions={ ['default']=function(sel) vim.cmd(":!gh pr checkout "..sel[1]:match("^\\S+")) end } })<CR>]], {noremap = true, silent = true, desc = 'Git pull requests'})


-- neo-tree toggle
map("n", "<space>E", ":Neotree toggle<CR>", { noremap = true, silent = true , desc ='Toggle NeoTree'})
map("n", "<M-f>", ":Neotree focus<CR>", { noremap = true, silent = true , desc ='Focus NeoTree'})
map("i", "<M-f>", "<ESC>:Neotree focus<CR>", { noremap = true, silent = true , desc ='Focus NeoTree'})

-- buffer/tab navigation
map("n", "<M-l>", ":bn<CR>", { noremap = true, silent = true , desc = 'Next buffer'})
map("i", "<M-l>", "<ESC>:bn<CR>", { noremap = true, silent = true , desc = 'Next buffer'})
map("n", "<M-h>", ":bp<CR>", { noremap = true, silent = true , desc = 'Previous buffer'})
map("i", "<M-h>", "<ESC>:bp<CR>", { noremap = true, silent = true, desc = 'Previous buffer'})
map("n", "<M-c>", ":bd<CR>", { noremap = true, silent = true, desc = 'Close buffer' })
map("i", "<M-c>", "<ESC>:bd<CR>", { noremap = true, silent = true, desc = 'Close buffer' })

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
-- map('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
-- map('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
-- map('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
-- map('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

-- local npairs = require('nvim-autopairs')

-- skip it, if you use another global object

-- kepmaps from mini.nvim
-- Helper function
local default_opts = {
  noremap = true,
  silent = true,
  expr = false,
  nowait = false,
  script = false,
  unique = false,
}

local keymap = function(mode, keys, cmd, opts)
  local o = vim.tbl_deep_extend('force', default_opts, opts or {})
  vim.keymap.set(mode, keys, cmd, o)
end

-- Simpler window navigation
keymap('n', [[<C-h>]], [[<C-w>h]])
keymap('n', [[<C-j>]], [[<C-w>j]])
keymap('n', [[<C-k>]], [[<C-w>k]])
keymap('n', [[<C-l>]], [[<C-w>l]])
-- Go to previous window (very useful with floating function documentation)
keymap('n', [[<C-p>]], [[<C-w>p]])
-- When in terminal, use this to go to Normal mode
keymap('t', [[<C-h>]], [[<C-\><C-N><C-w>h]])

-- Disable `s` shortcut (use `cl` instead) for safer usage of 'mini.surround'
keymap('n', [[s]], [[<Nop>]])
keymap('x', [[s]], [[<Nop>]])

-- Make `q:` do nothing instead of opening command-line-window, because it is
-- often hit by accident
-- Use c_CTRL-F or Telescope
-- keymap('n', [[q:]], [[<Nop>]])

-- Delete selection in Select mode (helpful when editing snippet placeholders)
keymap('s', "<BS>", "<BS>i")

-- lazygit.nvim mapping
map("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true , desc = 'LazyGit'})
-- diffview mapping
map("n", "<leader>gd", ":DiffviewOpen<CR>", { noremap = true, silent = true , desc = 'DiffView'})
