local M = {
  'akinsho/bufferline.nvim',
  enabled = false,
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
       separator_style = "thin", -- "slant", "slope", "thick", "thin"
      }
    })
  end
}

return M

