-- Plugins related to code completion/suggestions
local M = {
	{
		-- completion
    {
      'saghen/blink.cmp',
      lazy = false, -- lazy loading handled internally
      -- optional: provides snippets for the snippet source
      dependencies = 'rafamadriz/friendly-snippets',

      -- use a release tag to download pre-built binaries
      -- version = 'v0.*',
      -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
      build = 'cargo build --release',

      opts = {
        highlight = {
          -- sets the fallback highlight groups to nvim-cmp's highlight groups
          -- useful for when your theme doesn't support blink.cmp
          -- will be removed in a future release, assuming themes add support
          use_nvim_cmp_as_default = true,
        },
        -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'normal',

        -- experimental auto-brackets support
        -- accept = { auto_brackets = { enabled = true } }

        -- experimental signature help support
        trigger = { signature_help = { enabled = true } },
        -- for keymap, all values may be string | string[]
        -- use an empty table to disable a keymap
        keymap = {
          preset = 'super-tab',
          ['<CR>'] = { 'accept', 'fallback' },
        },
      }
    },
		{
			"neovim/nvim-lspconfig",
			event = { "BufReadPre", "BufNewFile" },
			dependencies = { 'VonHeikemen/lsp-zero.nvim' },
			config = function()
				-- See `:help vim.diagnostic.*` for documentation on any of the below functions
				local def_opts = { noremap = true, silent = true }
				local keymap = function(mode, keys, cmd, opts)
					local o = vim.tbl_deep_extend("force", def_opts, opts or {})
					vim.keymap.set(mode, keys, cmd, o)
				end

				keymap("n", "<space>e", vim.diagnostic.open_float, { desc = "Open diagnostic" })
				-- keymap("n", "<space>e", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = 'Open diagnotic' })

				keymap("n", "]d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
				keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
				-- keymap("n", "(d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = 'Previous diagnotssc' })
				-- keymap("n", ")d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = 'Next diagnostic' })
				keymap("n", "<space>q", vim.diagnostic.setloclist, { desc = "Add diagnostics to the location list" })
				-- keymap("n", "(E", function()
				--   require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
				-- end, { desc = 'Previous Error' })
				-- keymap("n", ")E", function()
				--   require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
				-- end, { desc = 'Next Error' })

				-- local cmp_nvim_lsp = require("cmp_nvim_lsp")
				-- local capabilities = vim.lsp.protocol.make_client_capabilities()
				-- capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

				--  for epo.nvim
				-- local capabilities = vim.tbl_deep_extend(
				--   'force',
				--   vim.lsp.protocol.make_client_capabilities(),
				--   require('epo').register_cap()
				-- )

				-- capabilities.textDocument.completion.completionItem.snippetSupport = false

				-- Use an on_attach function to only map the following keys
				-- after the language server attaches to the current buffer
				local on_attach = function(client, bufnr)
					if client.name == "ruff" then
						-- Disable hover in favor of other python language server
						client.server_capabilities.hoverProvider = false
					end
					-- Enable completion triggered by <c-x><c-o>
					vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
					-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.MiniCompletion.completefunc_lsp')

					-- Mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local def_opts = { noremap = true, silent = true, buffer = bufnr }

					-- keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { desc = 'Find references' })
					-- keymap('n', 'gD', vim.lsp.buf.declaration, { desc = 'Goto declaration' })
					keymap("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
					-- keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = 'Goto definition' })
					keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover doc" })
					-- keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = 'Hover documentation' })
					keymap("n", "gi", vim.lsp.buf.implementation, { desc = "Goto implementation" })
					keymap("n", "<space>k", vim.lsp.buf.signature_help, { desc = "Signature help" })
					keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace" })
					keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace" })
					keymap("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, { desc = "list workspace folders" })
					keymap("n", "<space>D", vim.lsp.buf.type_definition, { desc = "type definition" })
					keymap("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename buffer" })
					-- keymap("n", "<space>rn", "<cmd>Lspsaga rename<CR>", { desc = 'Rename symbol' })
					keymap("n", "<space>ca", vim.lsp.buf.code_action, { desc = "Code action" })
					-- keymap({ "n", "v" }, "<space>ca", "<cmd>Lspsaga code_action<CR>", { desc = 'Code action' })
					keymap("n", "gr", vim.lsp.buf.references, { desc = "Buffer references" })
					-- keymap("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", { desc = 'Outline toggle' })
					-- Show buffer diagnostic
					-- keymap("n", "<leader>lb", "<cmd>Lspsaga show_buf_diagnostics<CR>", {desc = 'Show buffer diagnostic'})
					-- format buffer
					keymap("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer" })
				end

				-- lsp_installer.on_server_ready(function(server)
        local lsp_zero = require("lsp-zero")
        lsp_zero.extend_lspconfig({
          sign_text = true,
          lsp_attach = on_attach,
          -- capabilities = capabilities
        })
        require'lspconfig'.jedi_language_server.setup{}
        require'lspconfig'.ruff.setup{}
        require'lspconfig'.rust_analyzer.setup{}
      end,
		},
		-- {
		-- 	"zbirenbaum/copilot.lua",
		-- 	event = "InsertEnter",
		-- 	config = function()
		-- 		require("copilot").setup({
		-- 			suggestion = { enabled = true }, -- auto_trigger = true },
		-- 			panel = { enabled = false },
		-- 		})
		-- 	end,
		-- },
		-- {
		-- 	"CopilotC-Nvim/CopilotChat.nvim",
		--     branch = "canary",
		--     dependencies = {
		--       { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
		--       { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		--     },
		--     build = "make tiktoken", --
		-- 	opts = {
		-- 		mode = "split", -- newbuffer or split  , default: newbuffer
		-- 	},
		-- 	lazy = true,
		-- 	keys = {
		-- 		{ "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
		-- 		{ "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
		-- 	},
		-- },
	},
}

return M
