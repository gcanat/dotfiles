local M = {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" } },
  -- stylua: ignore
  keys = {
    { "<leader>sr", function() require("persistence").load() end, desc = "Restore Session" },
    { "<leader>sl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    { "<leader>sd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
  },
}

return M
