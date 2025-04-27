vim.o.clipboard = "unnamed" -- Sync with system clipboard
--Incremental live completion
vim.o.inccommand = "nosplit"
--Set highlight on search
vim.o.hlsearch = false
--Make line numbers + relative numbers default
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.numberwidth = 3
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

-- linebreaks
vim.o.wrap = true

-- indentation
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
-- Continue comment marker in new lines.
vim.opt.formatoptions:append("ro")
-- split as desired
vim.o.splitbelow = true -- Horizontal split below current.
vim.o.splitright = true -- Vertical split to right of current.
--Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 400
vim.wo.signcolumn = "yes"
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.g.markdown_fenced_languages = { "html", "python", "bash=sh", "R=r" }

--Set colorscheme (order is important here)
vim.o.termguicolors = true
-- disable show mode in command line because it's already displayed by status line
vim.o.showmode = false
-- change leader key
-- vim.g.mapleader = ","
-- vim.g.maplocalleader = ";"
-- vim.opt.spell = true
-- vim.opt.spelllang = { 'en_us' }

-- teawks for netrw

vim.g.netrw_banner = 0        -- disable annoying banner
vim.g.netrw_browse_split = 4  -- open in prior window
vim.g.netrw_altv = 1          -- open splits to the right
vim.g.netrw_liststyle = 3     -- tree view
vim.g.netrw_winsize = 10
vim.g.netrw_sizestyle = 'h'   -- human readable sizes
-- vim.g.netrw_list_hide = [[, \(^\|\s\s\)\zs\.\S\+]]
vim.g.netrw_list_hide = vim.fn['netrw_gitignore#Hide']() .. [[,.git/]]

-- vim.api.nvim_command('guicurosr=n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor20')
-- vim.o.guicursor='guicursor=v-c-sm:block,n-i-ci-ve:block,r-cr-o:hor20'
vim.o.guicursor = "v-c-sm:block,n-i-ci-ve:block,r-cr-o:hor20"

-- completion options
vim.o.completeopt = "menu,menuone,noselect,noinsert"
-- vim.o.completeopt = 'menuone,noselect,noinsert'
-- vim.g.coq_settings = {
--   ["auto_start"] = "shut-up",
--   -- ["clients.lsp.resolve_timeout"] =  1,
--   -- ["clients.lsp.always_on_top"] = null,
--   -- ["clients.lsp.weight_adjust"] = 5,
--   ["display.preview.border"] = "rounded",
--   ["display.preview.positions"] = { ["north"] = 2, ["south"] = 3, ["west"] = 4, ["east"] = 1 },
--   -- ["display.preview.resolve_timeout"] = 0.3,
--   -- ["limits.completion_auto_timeout"] = 1,
--   ["keymap.recommended"] = false
-- }

-- don't load the plugins below
local builtins = {
	"gzip",
	-- "zip",
	-- "zipPlugin",
	-- "fzf",
	-- "tar",
	-- "tarPlugin",
	-- "getscript",
	-- "getscriptPlugin",
	-- "vimball",
	-- "vimballPlugin",
	-- "2html_plugin",
	-- "matchit",
	-- "matchparen",
	-- "logiPat",
	-- "rrhelper",
	-- "netrw",
	-- "netrwPlugin",
	-- "netrwSettings",
	-- "netrwFileHandlers",
	-- "shada_plugin",
	-- "spellfile_plugin",
	-- "tutor_mode_plugin",
	-- "rrhelper",
	-- "remote_plugins",
}

for _, plugin in ipairs(builtins) do
	vim.g["loaded_" .. plugin] = 1
end

-- hide cmdline when not used
vim.opt.cmdheight = 1

-- python path
-- vim.g['python3_host_prog'] = '/home/guillaume/venv/valgo2/bin/python3'

-- vim.g.copilot_no_tab_map = true
--
-- vim.g.magma_automatically_open_output = false
-- vim.g['magma_automatically_open_output'] = false
-- vim.g['magma_image_provider'] = "ueberzug"
-- vim.g['magma_image_provider'] = "kitty"
-- vim.g.molten_image_provider = "image.nvim"

vim.o.grepprg = [[rg -HS --no-heading --column -g "!*.ipynb" -g "!*__pycache__*" -g "!target/**" -g "!build/**" -g "!**/dist/**" -g "!tags"]]

function Fd(file_pattern, _)
  -- if first char is * thenfuzzy search
  if file_pattern:sub(1, 1) == "*" then
    file_pattern = file_pattern:gsub(".", ".*%0") .. ".*"
  end
  local cmd = 'fdfind  --color=never --full-path --type file --hidden --exclude=".git" "' .. file_pattern .. '"'
  local result = vim.fn.systemlist(cmd)
  return result
end

vim.opt.findfunc = "v:lua.Fd"
