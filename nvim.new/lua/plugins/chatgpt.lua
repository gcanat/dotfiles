local M = {
  "jackMort/ChatGPT.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    require("chatgpt").setup({
    -- optional configuration
    })
  end,
  cmd = { "ChatGPT", "ChatGPTActAs", "ChatGPTEditWithInstructions"}
}

return M
