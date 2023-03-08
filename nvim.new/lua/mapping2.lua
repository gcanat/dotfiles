local wk = require("which-key")

local n_keymaps = {
  ["<leader>"] = {
    f = {
      f = {"<cmd>lua require('telescope.builtin').buffers()<CR>", "Telescope buffers"},
      b = {"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", "Telescope fuzzy find"},
      h = {"<cmd>lua require('telescope.builtin').help_tags()<CR>", "Telescope help tags"},
      t = {"<cmd>lua require('telescope.builtin').tags()<CR>", "Telescope tags"},
      d = {"<cmd>lua require('telescope.builtin').grep_string()<CR>", "Telescope grep string"},
      p = {"<cmd>lua require('telescope.builtin').live_grep()<CR>", "Telescope live grep"},
      o = {"<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>", "Telescope tags current buffer"},
    },
    ["?"] = {"<cmd>lua require('telescope.builtin').oldfiles()<CR>", "Telescope old files"},
    ["<space>"] = {"<cmd>lua require('telescope.builtin').buffers()<CR>", "Telescope buffers"},
    g = {
      c = {":Telescope git_commits<CR>", "Git commits"},
      s = {":Telescope git_status<CR>", "Git status"},
      b = {":Telescope git_branches<CR>", "Git branches"},
      i = {":Telescope gh issues<CR>", "Git issues"},
      p = {":Telescope gh pull_request<CR>", "Git pull requests"},
      g = {":LazyGit<CR>", "LazyGit"},
      d = {":DiffviewOpen<CR>", "DiffView"}

    },
    o = {":OSCYank<CR>", "Copy to clipboard"},
  },
  ["Y"] = {"y$", "Yank until end of line"},
  -- Simpler window navigation
  ["<C-h>"] = {"<C-w>h", "Go to left window"},
  ["<C-j>"] = {"<C-w>j", "Go to down window"},
  ["<C-k>"] = {"<C-w>k", "Go to up window"},
  ["<C-l>"] = {"<C-w>l", "Go to right window"},
  -- Go to previous window (very useful with floating function documentation)
  ["<C-p>"] = {"<C-w>p", "Previous window"},
  ["s"] = {"<Nop>", "Nothing"},
  -- NeoTree mappings
  ["<F3>"] = {":NeoTreeShow<CR>", "Toggle NeoTree"},
  ["<M-f>"] = {":NeoTreeFocus<CR>", "Focus NeoTree"},
  -- buffer navigation
  ["<M-l>"] = {":bn<CR>", "Next buffer"},
  ["<M-h>"] = {":bp<CR>", "Previous buffer"},
  ["<M-c>"] = {":bd<CR>", "Close buffer"},
}

for i = 0, 10 do
  n_keymaps[tostring(i)] = "which_key_ignore"
end

wk.register(n_keymaps, {mode = "n"})

local i_keymaps = {
  ["<M-f>"] = {":NeoTreeFocus<CR>", "Focus NeoTree"},
  ["<M-l>"] = {"<ESC>:bn<CR>", "Next buffer"},
  ["<M-h>"] = {"<ESC>:bp<CR>", "Previous buffer"},
  ["<M-c>"] = {"<ESC>:bd<CR>", "Close buffer"}
}
wk.register(i_keymaps, {mode = "i"})

local t_keymaps = {
  ["<C-h>"] = {[[<C-\><C-N><C-w>h]], "Exit terminal mode", mode="t"},
}
wk.register(t_keymaps, {mode = "t"})

local x_keymaps = {
  ["s"]= {"<Nop>"}
}
wk.register(x_keymaps, {mode = "x"})

local s_keymaps = {
  ["<BS>"] = {"<BS>i"}
}
wk.register(s_keymaps, {mode = "s"})


local map = vim.keymap.set
-- these mappings are coq recommended mappings unrelated to nvim-autopairs
map('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
map('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
map('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
map('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })


local npairs = require('nvim-autopairs')
-- skip it, if you use another global object
_G.MUtils= {}

MUtils.CR = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
      return npairs.esc('<c-y>')
    else
      return npairs.esc('<c-e>') .. npairs.autopairs_cr()
    end
  else
    return npairs.autopairs_cr()
  end
end
map('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

MUtils.BS = function()
  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
    return npairs.esc('<c-e>') .. npairs.autopairs_bs()
  else
    return npairs.autopairs_bs()
  end
end
map('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
