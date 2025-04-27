-- Plugins related to code completion/suggestions
local M = {
	{
    -- {
    --   "rafamadriz/friendly-snippets",
    --   event = {"BufReadPre", "BufNewFile"},
    -- },
		-- completion
    {
      'saghen/blink.cmp',
      lazy = false,
      dependencies = 'rafamadriz/friendly-snippets',
      build = 'cargo build --release',
      opts = {
        appearance = {
          use_nvim_cmp_as_default = true,
          nerd_font_variant = 'mono',
        },
        keymap = {
          preset = 'default',
          ['<CR>'] = { 'accept', 'fallback' },
          ['<Tab>'] = { 'select_next', 'fallback' },
          ['<S-Tab>'] = { 'select_prev', 'fallback' },
          ['<C-l>'] = { 'snippet_forward', 'fallback' },
          ['<C-h>'] = { 'snippet_backward', 'fallback' },
        },
        -- cmdline = { completion = { menu = { auto_show = true } } },
        cmdline = {
          sources = {},
          keymap = { preset = 'none' },
        },
        completion = {
          -- dont display icons in the menu
          -- menu = { draw = { columns = { {"label", "label_description", gap = 1 } } } },
          list = { selection = { preselect = false, auto_insert = true} },
          documentation = { auto_show = true, auto_show_delay_ms = 200 },
        },
        signature = { enabled = true },
      }
    },
		{
			"neovim/nvim-lspconfig",
			event = { "BufReadPre", "BufNewFile" },
			config = function()
				local def_opts = { noremap = true, silent = true }
				local keymap = function(mode, keys, cmd, opts)
					local o = vim.tbl_deep_extend("force", def_opts, opts or {})
					vim.keymap.set(mode, keys, cmd, o)
				end

				keymap("n", "<space>e", vim.diagnostic.open_float, { desc = "Open diagnostic" })
				keymap("n", "]d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
				keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
				keymap("n", "<space>q", vim.diagnostic.setloclist, { desc = "Add diagnostics to the location list" })

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

					keymap("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
					keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover doc" })
					keymap("n", "gi", vim.lsp.buf.implementation, { desc = "Goto implementation" })
					keymap("n", "<space>k", vim.lsp.buf.signature_help, { desc = "Signature help" })
					keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace" })
					keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace" })
					keymap("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, { desc = "list workspace folders" })
					keymap("n", "<space>D", vim.lsp.buf.type_definition, { desc = "type definition" })
					keymap("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename buffer" })
					keymap("n", "<space>ca", vim.lsp.buf.code_action, { desc = "Code action" })
					keymap("n", "gr", vim.lsp.buf.references, { desc = "Buffer references" })
					keymap("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer" })

          -- autoformat on save
          local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format()
              end,
            })
          end
				end

        local lspconf = require('lspconfig')
        local capab = require('blink.cmp').get_lsp_capabilities()
        lspconf.jedi_language_server.setup({ capabilities = capab, on_attach = on_attach })
        lspconf.ruff.setup({ capabilities = capab, on_attach = on_attach })
        lspconf.rust_analyzer.setup({ capabilities = capab, on_attach = on_attach })
      end,
		},
	},
}

return M
