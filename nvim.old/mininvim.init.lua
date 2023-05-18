-- aliases
local map = vim.api.nvim_set_keymap -- alias to easier keymapping

-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
  ]],
  false
)

local use = require("packer").use
require("packer").startup(function()
  use('wbthomason/packer.nvim')
  use('echasnovski/mini.nvim')
  use('neovim/nvim-lspconfig')
  use('williamboman/nvim-lsp-installer')
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use('lewis6991/gitsigns.nvim')
  use('kyazdani42/nvim-web-devicons')
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }) -- file tree browser
  use("folke/which-key.nvim")
end)

--Incremental live completion
vim.o.inccommand = "nosplit"
--Set highlight on search
vim.o.hlsearch = true
--Make line numbers default
vim.wo.number = true
--Do not save when switching buffers
vim.o.hidden = true
--Enable mouse mode
vim.o.mouse = "a"
--Enable break indent
vim.o.breakindent = true
--Save undo history
vim.cmd([[set undofile]])
--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- indentation
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
--vim.o.textwidth = 79
-- Continue comment marker in new lines.
vim.opt.formatoptions:append("ro")
-- split as desired
vim.o.splitbelow = true -- Horizontal split below current.
vim.o.splitright = true -- Vertical split to right of current.
--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"
-- highlight current line and column but only for current window
vim.api.nvim_exec(
	[[
    augroup CursColLine
        autocmd!
        au WinLeave * setlocal nocursorline nocursorcolumn
        au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
    augroup end
    ]],
	false
)

--Set colorscheme (order is important here)
vim.o.termguicolors = true
-- disable show mode in command line because it's already displayed by status line
vim.o.showmode = false
-- change leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ";"

local palette = require('mini.base16').mini_palette('#112641', '#e2e98f', 75)
require('mini.base16').setup({palette = palette, name = 'minischeme', use_cterm = true})
require('mini.comment').setup()
require('mini.completion').setup()
require('mini.cursorword').setup()
require('mini.fuzzy').setup()
require('mini.indentscope').setup()
require('mini.pairs').setup()
require('mini.statusline').setup()
require('mini.tabline').setup()
require("nvim-tree").setup()
require('telescope').setup({
  defaults = {
    generic_sorter = require('mini.fuzzy').get_telescope_sorter
  }
})
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "python" },
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  }
}
-- which-key
require("which-key").setup({
  window = {
    border = "single",
  },
})

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end)

vim.cmd("colorscheme minischeme")
-- completion shortcuts
map('i', [[<Tab>]],   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { noremap = true, expr = true })
map('i', [[<S-Tab>]], [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })

-- Telescope shortcuts
map("n", "<leader><space>", [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
map("n", "<leader>ff", [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
map(
	"n",
	"<leader>fb",
	[[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
	{ noremap = true, silent = true }
)
map("n", "<leader>fh", [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
map("n", "<leader>ft", [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
map("n", "<leader>fd", [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
map("n", "<leader>fp", [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
map(
	"n",
	"<leader>fo",
	[[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
	{ noremap = true, silent = true }
)
map("n", "<leader>?", [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })
-- nvim-tree toggle
map("n", "<F3>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
-- buffer/tab navigation
map("n", "<M-Right>", ":bn<CR>", { noremap = true, silent = true })
map("i", "<M-Right>", "<ESC>:bn<CR>", { noremap = true, silent = true })
map("n", "<M-Left>", ":bp<CR>", { noremap = true, silent = true })
map("i", "<M-Left>", "<ESC>:bp<CR>", { noremap = true, silent = true })
map("n", "<M-c>", ":bd<CR>", { noremap = true, silent = true })
map("i", "<M-c>", "<ESC>:bd<CR>", { noremap = true, silent = true })
