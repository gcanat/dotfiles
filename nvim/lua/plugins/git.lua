-- Plugins for all things git related
local M = {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "]c", function()
						if vim.wo.diff then
							return "]c"
						end
						vim.schedule(function()
							gs.next_hunk()
						end)
						return "<Ignore>"
					end, { expr = true })

					map("n", "[c", function()
						if vim.wo.diff then
							return "[c"
						end
						vim.schedule(function()
							gs.prev_hunk()
						end)
						return "<Ignore>"
					end, { expr = true })

					-- Actions
					map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
					map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
					map("v", "<leader>hs", function()
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end,
            { desc = "Stage hunk" }
          )
					map("v", "<leader>hr", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end,
            { desc = "Reset hunk" }

          )
					map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
					map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
					map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })
					map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
					map("n", "<leader>hb", function()
						gs.blame_line({ full = true })
					end,
            { desc = "Blame line" }
          )
					map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
					map("n", "<leader>hd", gs.diffthis, { desc = "Diff with index" })
					map("n", "<leader>hD", function()
						gs.diffthis("~")
					end,
            { desc = "Diff with last commit" }
          )
					map("n", "<leader>hi", gs.preview_hunk_inline, { desc = "Preview hunk inline" })

					-- Text object
					map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
				end,
			})
		end,
	},
	{
		{
			"tpope/vim-fugitive",
			cmd = {
				"G",
				"Git",
				"Gread",
				"Gwrite",
				"Ggrep",
				"Glgrep",
				"Gclog",
				"Gllog",
				"Gdiffsplit",
				"Gvdiffsplit",
				"GMove",
				"GDelete",
				"Gunlink",
				"GBrowse",
			},
		},
		{
			"rbong/vim-flog",
			lazy = true,
			cmd = { "Flog", "Flogsplit", "Floggit" },
			dependencies = {
				"tpope/vim-fugitive",
			},
		},
	},
	{
		"pwntester/octo.nvim",
		enabled = true,
		-- dependencies = {
		--    'nvim-telescope/telescope.nvim',
		-- },
		config = function()
			require("octo").setup({
				picker = "fzf-lua",
				-- picker_config = { use_emojis = true },
				-- default_to_projects_v2 = true,
			})
		end,
		cmd = { "Octo" },
	},
}

return M
