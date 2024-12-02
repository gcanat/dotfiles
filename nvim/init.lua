local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
		vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
	end
end
vim.opt.rtp:prepend(lazypath)

-- change leader key
vim.g.mapleader = ","
vim.g.maplocalleader = " "

vim.cmd([[
  if has('nvim') && executable('nvr')
    let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
  endif
]])

require("lazy").setup("plugins", {
	defaults = {
		lazy = true,
	},
	ui = {
		border = "rounded",
	},
	checker = {
		enabled = false,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"zip",
				"zipPlugin",
				"tarPlugin",
				"tutor",
				"tohtml",
			},
		},
	},
})

-- all the setups that are pretty much oneliners go here
require("config") -- usual vim options

vim.cmd("colorscheme kanagawa")
-- vim.cmd("colorscheme serene-transparent")
vim.cmd("hi Normal guibg=NONE")

-- load settings from other files in lua/ dir
require("commands")
require("mapping")
