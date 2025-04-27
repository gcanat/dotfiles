-- aliases
local map = vim.keymap.set -- alias to easier keymapping
-- Mappings.
-- Y yank until the end of line
map("n", "Y", "y$", { noremap = true, desc = "Yank until end of line" })
map("n", "à", "]", { remap = true, desc = "" })
map("n", "ç", "[", { remap = true, desc = "" })

map("n", "-", "<Cmd>15Lex<CR>", { noremap = true,  desc = "Open netrw" })

-- stay in the middle of the screen when scrolling
-- map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- replace with yanked does not overwrite register
map("x", "<leader>p", [["_dP]])
-- yank to system clipboard
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map({ "n", "v" }, "<leader>d", [["_d]])

-- FzfLua keymaps
map("n", "<leader>fe", ":FzfLua files<CR>", { noremap = true, silent = true, desc = "Find Files" })
map("n", "<leader>b", ":FzfLua buffers<CR>", { noremap = true, silent = true, desc = "Find Buffers" })
map("n", "<leader>fh", ":FzfLua help_tags<CR>", { noremap = true, silent = true, desc = "Find Help Tags" })
map("n", "<leader>ft", ":FzfLua tags<CR>", { noremap = true, silent = true, desc = "Find Tags" })
map("n", "<leader>fd", ":FzfLua grep_strings<CR>", { noremap = true, silent = true, desc = "Find grep strings" })
map("n", "<leader>cw", ":FzfLua grep_cword<CR>", { noremap = true, silent = true, desc = "Grep cword" })
map("n", "<leader>cW", ":FzfLua grep_cWORD<CR>", { noremap = true, silent = true, desc = "Grep cWORD" })
map("n", "<leader>fg", ":FzfLua live_grep_native<CR>", { noremap = true, silent = true, desc = "Find live grep" })
map("n", "<leader>fm", ":FzfLua oldfiles<CR>", { noremap = true, silent = true, desc = "Find oldfiles" })

map("n", "<leader>gc", ":FzfLua git_commits<CR>", { noremap = true, silent = true, desc = "Git commits" })
map("n", "<leader>gs", ":FzfLua git_status<CR>", { noremap = true, silent = true, desc = "Git status" })
map("n", "<leader>gb", ":FzfLua git_branches<CR>", { noremap = true, silent = true, desc = "Git branches" })
-- map("n", "<leader>gi", ":FzfLua gh issues<CR>", { noremap = true, silent = true, desc = "Git issues" })
-- map("n", "<leader>gp", ":FzfLua gh pull_request<CR>", { noremap = true, silent = true, desc = "Git pull requests" })
map(
	"n",
	"<leader>gp",
	[[<cmd>lua require'fzf-lua'.fzf_exec("gh pr list --limit 300", { actions={ ['default']=function(sel) vim.cmd(":!gh pr checkout "..sel[1]:match("^\\S+")) end } })<CR>]],
	{ noremap = true, silent = true, desc = "Git pull requests" }
)

-- buffer/tab navigation
map("n", "<M-l>", ":bn<CR>", { noremap = true, silent = true, desc = "Next buffer" })
map("i", "<M-l>", "<ESC>:bn<CR>", { noremap = true, silent = true, desc = "Next buffer" })
map("n", "<M-h>", ":bp<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
map("i", "<M-h>", "<ESC>:bp<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
map("n", "<M-c>", ":bd<CR>", { noremap = true, silent = true, desc = "Close buffer" })
map("i", "<M-c>", "<ESC>:bd<CR>", { noremap = true, silent = true, desc = "Close buffer" })

-- local imap_expr = function(lhs, rhs)
--   vim.keymap.set('i', lhs, rhs, { expr = true })
-- end
-- imap_expr('<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
-- imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

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
	local o = vim.tbl_deep_extend("force", default_opts, opts or {})
	vim.keymap.set(mode, keys, cmd, o)
end

-- Simpler window navigation
keymap("n", [[<C-h>]], [[<C-w>h]])
keymap("n", [[<C-j>]], [[<C-w>j]])
keymap("n", [[<C-k>]], [[<C-w>k]])
keymap("n", [[<C-l>]], [[<C-w>l]])
-- Go to previous window (very useful with floating function documentation)
keymap("n", [[<C-p>]], [[<C-w>p]])
-- When in terminal, use this to go to Normal mode
keymap("t", [[<C-h>]], [[<C-\><C-N><C-w>h]])

-- Disable `s` shortcut (use `cl` instead) for safer usage of 'mini.surround'
keymap("n", [[s]], [[<Nop>]])
keymap("x", [[s]], [[<Nop>]])

-- Make `q:` do nothing instead of opening command-line-window, because it is
-- often hit by accident
-- Use c_CTRL-F or Telescope
-- keymap('n', [[q:]], [[<Nop>]])

-- Delete selection in Select mode (helpful when editing snippet placeholders)
keymap("s", "<BS>", "i<BS>")

-- quarto nvim
-- map("n", "<leader>qp", [[cmd require('quarto').quartoPreview<CR>]], {silent = true, noremap = true, desc = 'Qarto Preview'})

map(
	"v",
	"<localleader>rv",
	":<C-u>MoltenEvaluateVisual<CR>",
	{ silent = true, noremap = true, desc = "Molten Evaluate Visual" }
)
