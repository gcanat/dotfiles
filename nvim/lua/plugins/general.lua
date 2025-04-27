-- General quality of life plugins
local M = {
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	-- {
	-- 	"kyazdani42/nvim-web-devicons",
	-- 	lazy = true,
	-- },
  -- {
  --   'skywind3000/vim-color-export',
  --   lazy = false,
  --   config = function ()
  --     vim.g.color_export_all = 1
  --     vim.g.color_export_convert = 1
  --   end,
  -- },
  -- {
  --   "romanaverin/charleston.nvim",
  --   name = "charleston",
  --   priority = 1000,
  -- },
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	config = function()
	-- 		require("kanagawa").setup({
	-- 			compile = true, -- enable compiling the colorscheme
	-- 			undercurl = true, -- enable undercurls
	-- 			commentStyle = { italic = true },
	-- 			functionStyle = {},
	-- 			keywordStyle = { italic = true },
	-- 			statementStyle = { bold = true },
	-- 			typeStyle = {},
	-- 			transparent = true, -- do not set background color
	-- 			dimInactive = true, -- dim inactive window `:h hl-NormalNC`
	-- 			terminalColors = true, -- define vim.g.terminal_color_{0,17}
	-- 			colors = { -- add/modify theme and palette colors
	-- 				palette = {},
	-- 				theme = { wave = {}, lotus = {}, dragon = {}, all = { ui = { bg_gutter = "none" } } },
	-- 			},
	-- 			-- overrides = function(colors) -- add/modify highlights
	-- 			--     return {}
	-- 			-- end,
	-- 			-- theme = "wave", -- Load "wave" theme when 'background' option is not set
	-- 			-- background = { -- map the value of 'background' option to a theme
	-- 			-- 	dark = "wave", -- try "dragon" !
	-- 			-- 	light = "lotus",
	-- 			-- },
	-- 		})
	-- 	end,
	-- },
  {"sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_transparent_background = 1
    end,
  },
  -- { "samharju/serene.nvim"},
	{
		"echasnovski/mini.nvim",
		event = "VeryLazy",
		config = function()
			-- require('mini.completion').setup({
			--    lsp_completion = {
			--     source_func = 'omnifunc',
			--     auto_setup = false,
			--   },
			-- })
      -- require('mini.snippets').setup({
      --     snippets = {
      --     require("mini.snippets").gen_loader.from_lang(),
      --   },
      -- })
			require("mini.cursorword").setup()
			require('mini.pairs').setup()
			-- require('mini.fuzzy').setup()
			require("mini.statusline").setup({
				use_icons = true,
			})
			require("mini.notify").setup({
				lsp_progress = {
					-- Whether to enable showing
					enable = false,
				},
			})
      require("mini.icons").setup()
      MiniIcons.mock_nvim_web_devicons()
      -- MiniIcons.tweak_lsp_kind()
			-- require('mini.indentscope').setup({
			--   draw = {
			--     delay = 100,
			--     -- disable animation because I find it annoying
			--     animation = require('mini.indentscope').gen_animation.none()
			--   }
			-- })
			require("mini.surround").setup(
				-- default config but here to show the keymaps
				{
					-- Module mappings. Use `''` (empty string) to disable one.
					mappings = {
						add = "sa", -- Add surrounding in Normal and Visual modes
						delete = "sd", -- Delete surrounding
						find = "sf", -- Find surrounding (to the right)
						find_left = "sF", -- Find surrounding (to the left)
						highlight = "sh", -- Highlight surrounding
						replace = "sr", -- Replace surrounding
						update_n_lines = "sn", -- Update `n_lines`

						suffix_last = "l", -- Suffix to search with "prev" method
						suffix_next = "n", -- Suffix to search with "next" method
					},
				}
			)
			require("mini.comment").setup({
				mappings = {
					comment = "gc",
					comment_line = "gcc",
					textobject = "gc",
				},
			})
			-- require('mini.sessions').setup({
			--   autoread = true,
			-- })
			-- require('mini.tabline').setup({
			--   show_icons = false,
			-- })
			-- require('mini.base16').setup({
			--   palette = require('mini.base16').mini_palette('#24273a', '#cad3f5', 65),
			--   plugins = {
			--     default = true,
			--   }
			-- })
			local miniclue = require("mini.clue")
			miniclue.setup({
				triggers = {
					-- Leader triggers
					{ mode = "n", keys = "<Leader>" },
					{ mode = "x", keys = "<Leader>" },
					{ mode = "n", keys = "<space>" },

					-- Built-in completion
					{ mode = "i", keys = "<C-x>" },

					-- `g` key
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },

					-- Marks
					{ mode = "n", keys = "'" },
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },

					-- Registers
					{ mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },

					-- Window commands
					{ mode = "n", keys = "<C-w>" },

					-- `z` key
					{ mode = "n", keys = "z" },
					{ mode = "x", keys = "z" },
					-- ')' and ']' keys
					{ mode = "n", keys = ")" },
					{ mode = "n", keys = "]" },
					{ mode = "n", keys = "[" },
					{ mode = "n", keys = "(" },
				},

				clues = {
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
				window = {
					delay = 200,
				},
			})
		end,
	},
}

return M
