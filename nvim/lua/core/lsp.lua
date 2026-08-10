local map = vim.keymap.set
vim.lsp.config('*', {
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    },
  },
  root_markers = { '.git' },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then return end
    -- enable lsp completion
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
    end
    vim.bo[ev.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'

    --- @param diagnostic? vim.Diagnostic
    --- @param bufnr integer
    local function on_jump(diagnostic, bufnr)
      if not diagnostic then return end

      vim.diagnostic.show(
        diagnostic.namespace,
        bufnr,
        { diagnostic },
        { virtual_lines = { current_line = true }, virtual_text = false }
      )
    end

    vim.diagnostic.config({ jump = { on_jump = on_jump } })
    map({ "n", "x" }, "]d", function() vim.diagnostic.jump({count = 1}) end, { desc = "Next Diagnostic" })
    map({ "n", "x" }, "[d", function() vim.diagnostic.jump({count = -1}) end, { desc = "Prev Diagnostic" })
    map("n", "<space>q", vim.diagnostic.setloclist, { desc = "Add diagnostics to the location list" })
    map("n", "<space>e", vim.diagnostic.open_float, { desc = "Open diagnostic" })
    map("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf })
    map("n", "<space>rn", vim.lsp.buf.rename, { buffer = ev.buf })
    map("n", "<space>ca", vim.lsp.buf.code_action, { buffer = ev.buf })
    map("n", "gr", vim.lsp.buf.references, { buffer = ev.buf })
    map("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf })
    map("n", "gO", vim.lsp.buf.document_symbol, { buffer = ev.buf })
    map("n", "<leader>lf", vim.lsp.buf.format, { buffer = ev.buf })
    map("n", "<space>k", vim.lsp.buf.signature_help, { buffer = ev.buf })
    map("i", "<C-s>", vim.lsp.buf.signature_help, { buffer = ev.buf })
  end,
})

-- enable configured language servers
vim.lsp.enable({'lua_ls', 'ruff', 'rust_analyzer', 'bashls'})
vim.lsp.enable('jedi')
-- vim.lsp.enable('ty')
