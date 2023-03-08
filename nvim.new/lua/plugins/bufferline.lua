local M = {
  'akinsho/bufferline.nvim',
  event = "BufReadPre",
  config = function()
    require("bufferline").setup({
      options = {
       separator_style = "slant",
      }
    })
  end
}

return M

