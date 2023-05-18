local M = {
  'neovim/nvim-lspconfig',
  event = {"BufReadPre", "BufNewFile"},
  dependencies = {
    -- 'williamboman/nvim-lsp-installer',
    {
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup()
      end
    },
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require("mason-lspconfig").setup()
      end
    },
    {
      'jose-elias-alvarez/null-ls.nvim',
      config = function()
        local null_ls = require('null-ls')
        local sources = {
          -- null_ls.builtins.diagnostics.pylint,
          null_ls.builtins.diagnostics.ruff.with({
            extra_args = { '--line-length', 120 }
          }),
          null_ls.builtins.formatting.ruff.with({
            extra_args = { '--line-length', 120, '--ignore', 'F401' }
          }),
          -- null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.black.with({
            extra_args = { '--line-length', 120 }
          }),
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.yamllint,
        }
        null_ls.setup({ sources = sources })
      end
    },
  }
}

function M.config()
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local def_opts = { noremap = true, silent = true }
  local keymap = function(mode, keys, cmd, opts)
    local o = vim.tbl_deep_extend('force', def_opts, opts or {})
    vim.keymap.set(mode, keys, cmd, o)
  end

  -- keymap('n', '<space>e', vim.diagnostic.open_float, {desc = 'Open diagnostic'})
  keymap("n", "<space>e", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = 'Open diagnotic' })

  -- keymap('n', '[d', vim.diagnostic.goto_prev, {desc = 'Previous diagnostic'})
  -- keymap('n', ']d', vim.diagnostic.goto_next, {desc = 'Next diagnostic'})
  keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = 'Previous diagnotssc' })
  keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = 'Next diagnostic' })
  keymap('n', '<space>q', vim.diagnostic.setloclist, { desc = 'Add diagnostics to the location list' })
  keymap("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end, { desc = 'Previous Error' })
  keymap("n", "]E", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
  end, { desc = 'Next Error' })

  local cmp_nvim_lsp = require('cmp_nvim_lsp')
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.MiniCompletion.completefunc_lsp')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local def_opts = { noremap = true, silent = true, buffer = bufnr }

    keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { desc = 'Find references' })
    keymap('n', 'gD', vim.lsp.buf.declaration, { desc = 'Goto declaration' })
    -- keymap('n', 'gd', vim.lsp.buf.definition, { desc = 'Goto definition' })
    keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = 'Goto definition' })
    -- keymap('n', 'K', vim.lsp.buf.hover, { desc = 'Hover' })
    keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = 'Hover documentation' })
    keymap('n', 'gi', vim.lsp.buf.implementation, { desc = 'Goto implementation' })
    keymap('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature help' })
    keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { desc = 'Add workspace' })
    keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { desc = 'Remove workspace' })
    keymap('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { desc = 'list workspace folders' })
    keymap('n', '<space>D', vim.lsp.buf.type_definition, { desc = 'type definition' })
    -- keymap('n', '<space>rn', vim.lsp.buf.rename, {desc = 'Rename buffer'})
    keymap("n", "<space>rn", "<cmd>Lspsaga rename<CR>", { desc = 'Rename symbol' })
    -- keymap('n', '<space>ca', vim.lsp.buf.code_action, {desc = 'Code action'})
    keymap({ "n", "v" }, "<space>ca", "<cmd>Lspsaga code_action<CR>", { desc = 'Code action' })
    keymap('n', 'gr', vim.lsp.buf.references, { desc = 'Buffer references' })
    keymap("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", { desc = 'Outline toggle' })
    -- Show buffer diagnostic
    keymap("n", "<leader>lb", "<cmd>Lspsaga show_buf_diagnostics<CR>", {desc = 'Show buffer diagnostic'})
    -- format buffer
    keymap('n', '<space>f', vim.lsp.buf.format, { desc = 'Format buffer' })
  end

  -- local lsp_installer = require("nvim-lsp-installer")
  -- lsp_installer.on_server_ready(function(server)
  require('mason-lspconfig').setup_handlers{
    function(server_name)
      local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = { debounce_text_changes = 150 }
      }
      if server_name == "pylsp" then
        opts.settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = { 'E402' }
              },
              -- we use null-ls for formatting
              autopep8 = {
                enabled = false
              },
              yapf = {
                enabled = false
              }
            }
          }
        }
      end
      if server_name == "pyright" then
        opts.settings = {
          python = {
            analysis = {
              autoImportCompletions = true,
              typeCheckingMode = "basic",
            }
          }
        }
      end
      -- require("lspconfig")[server_name].setup(require('coq').lsp_ensure_capabilities(opts))
      require("lspconfig")[server_name].setup(opts)
    end
  }
end

return M
