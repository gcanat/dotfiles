-- Plugins related to code: highlighting, linting, etc
local M = {
	{
		"nvim-treesitter/nvim-treesitter",
		-- dev = false,
		build = ":TSUpdate",
		event = "BufReadPost",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},

		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "python", "markdown", "vim", "c", "yaml" },
				highlight = { enable = true },
				indent = { enable = true },
				textobjects = {
					select = {
						enable = true,
						-- automatically jump forward to textobj, similar to targets.vim
						lookahead = true,
						keymaps = {
							-- you can use the capture groups defined in textobjects.scm
							["af"] = { query = "@function.outer", desc = "select outer part of a function" },
							["if"] = { query = "@function.inner", desc = "select inner part of a function" },
							["ac"] = { query = "@class.outer", desc = "select outer part of a class" },
							["ic"] = { query = "@class.inner", desc = "select inner part of a class" },
						},
						-- you can choose the select mode (default is charwise 'v')
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@function.outer"] = "v", -- linewise
							["@class.outer"] = "<c-v>", -- blockwise
						},
						-- if you set this to `true` (default is `false`) then any textobject is
						-- extended to include preceding xor succeeding whitespace. succeeding
						-- whitespace has priority in order to act similarly to eg the built-in
						-- `ap`.
						include_surrounding_whitespace = false,
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]c"] = "@class.outer",
							["]o"] = "@loop.*",
						},
						goto_next_end = {
							["]m"] = "@function.outer",
							["]c"] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[c"] = "@class.outer",
						},
						goto_previous_end = {
							["[m"] = "@function.outer",
							["[c"] = "@class.outer",
						},
					},
					lsp_interop = {
						enable = true,
						border = "none",
						peek_definition_code = {
							["<leader>df"] = "@function.outer",
							["<leader>dc"] = "@class.outer",
						},
					},
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("lint").linters_by_ft = {
				-- python = { 'mypy', 'ruff' },
				yaml = { "yamllint" },
			}
			-- create the autocommand to run linter on insert leave and file save
			vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
	{
		"mfussenegger/nvim-dap",
		enabled = true,
		lazy = true,
		dependencies = {
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap-python",
			-- "nvim-telescope/telescope-dap.nvim",
		},
		keys = {
			{ "<leader>dR", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run to Cursor" },
			{
				"<leader>dE",
				"<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>",
				desc = "Evaluate Input",
			},
			{
				"<leader>dC",
				"<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
				desc = "Conditional Breakpoint",
			},
			{ "<leader>dU", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle UI" },
			{ "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back" },
			{ "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
			{ "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect" },
			{ "<leader>de", "<cmd>lua require'dapui'.eval()<cr>", desc = "Evaluate" },
			{ "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session" },
			{ "<leader>dh", "<cmd>lua require'dap.ui.widgets'.hover()<cr>", desc = "Hover Variables" },
			{ "<leader>dS", "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", desc = "Scopes" },
			{ "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
			{ "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
			{ "<leader>dp", "<cmd>lua require'dap'.pause.toggle()<cr>", desc = "Pause" },
			{ "<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit" },
			{ "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl" },
			{ "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", desc = "Start" },
			{ "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
			{ "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", desc = "Terminate" },
			{ "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },
			{ "<leader>de", "<cmd>lua require'dapui'.eval()<cr>", mode = "v", desc = "Evaluate" },
		},
		config = function()
			-- config
			local dap_breakpoint = {
				error = {
					text = "🟥",
					texthl = "LspDiagnosticsSignError",
					linehl = "",
					numhl = "",
				},
				rejected = {
					text = "",
					texthl = "LspDiagnosticsSignHint",
					linehl = "",
					numhl = "",
				},
				stopped = {
					text = "⭐️",
					texthl = "LspDiagnosticsSignInformation",
					linehl = "DiagnosticUnderlineInfo",
					numhl = "LspDiagnosticsSignInformation",
				},
			}

			vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
			vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
			vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

			-- extensions
			require("nvim-dap-virtual-text").setup({
				commented = true,
			})

			local dap, dapui = require("dap"), require("dapui")
			dapui.setup({}) -- use default
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- debuggers
			require("dap-python").setup("python", {})
		end,
	},
	{
		"nvim-neotest/neotest",
		enabled = true,
		dependencies = {
			"nvim-neotest/neotest-python",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = true,
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python"),
				},
			})
		end,
		keys = {
			{ "<leader>tn", "<cmd>lua require('neotest').run.run()<CR>", desc = "Run nearest test" },
			{ "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", desc = "Run current file" },
			{
				"<leader>td",
				"<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>",
				desc = "Debug nearest test",
			},
			{ "<leader>ts", "<cmd>lua require('neotest').run.stop()<CR>", desc = "Stop current test" },
			{ "<leader>ta", "<cmd>lua require('neotest').run.attach()<CR>", desc = "Attach current test" },
			{ "<leader>tu", "<cmd>lua require('neotest').summary.toggle()<CR>", desc = "Toggle test summary" },
			{ "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<CR>", desc = "Open output" },
		},
	},
	{
		"lkhphuc/jupyter-kernel.nvim",
		enabled = false,
		lazy = true,
		-- branch = "main",
		build = ":UpdateRemotePlugins",
		opts = {
			inspect = {
				-- opts for vim.lsp.util.open_floating_preview
				window = {
					max_width = 84,
				},
			},
			-- time to wait for kernel's response in seconds
			timeout = 0.5,
		},
		cmd = { "JupyterAttach", "JupyterInspect", "JupyterExecute" },
		keys = { { "<LocalLeader>k", "<Cmd>JupyterInspect<CR>", desc = "Inspect object in kernel" } },
	},
	{
		"benlubas/molten-nvim",
		lazy = true,
    enabled = false,
		-- version = "^1.0.0",
		dependencies = {
			"3rd/image.nvim",
			opts = {
				backend = "ueberzug", -- kitty or ueberzug
				max_width = 100,
				max_height = 20,
				max_height_window_percentage = math.huge,
				max_width_window_percentage = math.huge,
				window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
				window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
			},
		},
		build = ":UpdateRemotePlugins",
		init = function()
			-- these are examples, not defaults. Please see the readme
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 50
			vim.g.molten_auto_open_output = false
			vim.g.molten_tick_rate = 200
			vim.g.molten_virt_text_output = false
		end,
		keys = {
			{ "<LocalLeader>ma", ":MoltenInit<CR>", desc = "Init Molten" },
			{ "<LocalLeader>ml", ":MoltenEvaluateLine<CR>", desc = "Evaluate line" },
			{ "<LocalLeader>m", ":<C-u>MoltenEvaluateVisual<CR>", mode = "x", desc = "Evaluate visual" },
			{ "<LocalLeader>mr", ":MoltenReevaluateCell<CR>", desc = "Reevaluate cell" },
			{ "<LocalLeader>mo", ":MoltenShowOutput<CR>", desc = "Show cell output" },
			{ "<LocalLeader>me", ":noautocmd MoltenEnterOutput<CR>", desc = "Enter output window" },
			{ "<LocalLeader>mi", "<cmd>JupyterInspect<CR>", desc = "Inspect object in kernel" },
		},
	},
  -- {
  --   "GCBallesteros/jupytext.nvim",
  --   config = function()
  --     require("jupytext").setup({ style = "hydrogen", output_extension = "auto", force_ft = nil })
  --   end,
  --   -- Depending on your nvim distro or config you may need to make the loading not lazy
  --   lazy = false,
  --   ft = "ipynb",
  -- },
}
return M
