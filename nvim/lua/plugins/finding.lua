-- Plugins related to finding/searching/navigating files
local M = {
	{
		"ibhagwan/fzf-lua",
		enabled = true,
		cmd = "FzfLua",
		config = function()
			require("fzf-lua").setup({
				-- 'fzf-native',
				-- previewers = {
				--   builtin = {
				--     extensions = {
				--       ["png"] = { "chafa" },
				--       ["jpg"] = { "chafa" },
				--       ["gif"] = { "chafa" },
				--     },
				--   },
				-- },
				-- winopts = { preview = { default = "bat" } }, -- if this is enabled, image preview wont work
				-- manpages = { previewer = "man_native" },
				-- helptags = { previewer = "help_native" },
				-- tags = { previewer = "bat" },
				-- btags = { previewer = "bat" },
			})
		end,
	},
	{
		"folke/persistence.nvim",
		enabled = true,
		event = "BufReadPre",
		opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" } },
  -- stylua: ignore
  keys = {
    { "<leader>sr", function() require("persistence").load() end, desc = "Restore Session" },
    { "<leader>sl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    { "<leader>sd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
  },
	},
	{
		-- enable mini.starter
		{
			"echasnovski/mini.starter",
			enabled = false,
			-- version = false, -- wait till new 0.7.0 release to put it back on semver
			event = "VimEnter",
			opts = function()
				local neologo = {
					[[                                                                     ]],
					[[       ████ ██████           █████      ██                     ]],
					[[      ███████████             █████                             ]],
					[[      █████████ ███████████████████ ███   ███████████   ]],
					[[     █████████  ███    █████████████ █████ ██████████████   ]],
					[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
					[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
					[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
					[[                                                                       ]],
				}

				local logo = table.concat(neologo, "\n")

				local pad = string.rep(" ", 22)
				local new_section = function(name, action, section)
					return { name = name, action = action, section = pad .. section }
				end

				local starter = require("mini.starter")
      --stylua: ignore
      local config = {
        evaluate_single = true,
        header = logo,
        items = {
          -- new_section("Find file",    "Telescope find_files", "Telescope"),
          -- new_section("Recent files", "Telescope oldfiles",   "Telescope"),
          -- new_section("Grep text",    "Telescope live_grep",  "Telescope"),
          new_section("Find file",    "FzfLua files", "Files"),
          new_section("Recent files", "FzfLua oldfiles",   "Files"),
          new_section("Grep text",    "FzfLua live_grep",  "Files"),
          new_section("Session restore", "lua require('persistence').load()", "Workspace"),
          new_section("Fugitive", "G", "Workspace"),
          new_section("init.lua",     "e $MYVIMRC",           "Config"),
          new_section("Lazy",         "Lazy",                 "Config"),
          new_section("New file",     "ene | startinsert",    "Built-in"),
          new_section("Quit",         "qa",                   "Built-in"),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(pad .. "░ ", false),
          starter.gen_hook.aligning("center", "center"),
        },
      }
				return config
			end,
			config = function(_, config)
				-- close Lazy and re-open when starter is ready
				if vim.o.filetype == "lazy" then
					vim.cmd.close()
					vim.api.nvim_create_autocmd("User", {
						pattern = "MiniStarterOpened",
						callback = function()
							require("lazy").show()
						end,
					})
				end

				local starter = require("mini.starter")
				starter.setup(config)

				vim.api.nvim_create_autocmd("User", {
					pattern = "LazyVimStarted",
					callback = function()
						local stats = require("lazy").stats()
						local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
						local pad_footer = string.rep(" ", 8)
						starter.config.footer = pad_footer
							.. "⚡ Neovim loaded "
							.. stats.count
							.. " plugins in "
							.. ms
							.. "ms"
						pcall(starter.refresh)
					end,
				})
			end,
		},
	},
}
return M
