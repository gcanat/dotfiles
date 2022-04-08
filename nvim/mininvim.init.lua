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
--vim.g.onedark_terminal_italics = 2
--vim.cmd([[colorscheme onedark]])
--vim.cmd("colorscheme material")
--vim.g.material_style = "deep ocean"

-- disable show mode in command line because it's already displayed by status line
vim.o.showmode = false



local palette = require('mini.base16').mini_palette('#112641', '#e2e98f', 75)
require('mini.base16').setup({palette = palette, name = 'minischeme', use_cterm = true})
require('mini.comment').setup()
require('mini.completion').setup()
require('mini.pairs').setup()
require('mini.statusline').setup()
require('mini.tabline').setup()

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end)

vim.cmd("colorscheme minischeme")

map('i', [[<Tab>]],   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { noremap = true, expr = true })
map('i', [[<S-Tab>]], [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })
