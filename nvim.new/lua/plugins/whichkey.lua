local M = {
  'folke/which-key.nvim',
  config = function()
    vim.o.timeoutlen = 300
    require("which-key").setup({
      window = {
        border = "single",
      },
    })
  end,
  event = "VeryLazy"
}

return M
