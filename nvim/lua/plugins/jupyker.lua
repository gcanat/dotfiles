local M = {
  'lkhphuc/jupyter-kernel.nvim',
  -- branch = "main",
  build = ":UpdateRemotePlugins",
  lazy = true,
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
  -- config = function ()
  --   local opts = {
  --     inspect = {
  --       -- opts for vim.lsp.util.open_floating_preview
  --       window = {
  --         max_width = 84,
  --       },
  --     },
  --     -- time to wait for kernel's response in seconds
  --     timeout = 0.5,
  --   }
  --   require('jupyter-kernel.nvim').setup(opts)
  -- end,
  cmd = {"JupyterAttach", "JupyterInspect", "JupyterExecute"},
  keys = { { "<LocalLeader>k", "<Cmd>JupyterInspect<CR>", desc = "Inspect object in kernel" } },
}

return M
