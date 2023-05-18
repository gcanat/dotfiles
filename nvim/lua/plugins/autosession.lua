local M = {
  "rmagatti/auto-session",
  enabled = false,
  dependencies = {
    {
      "rmagatti/session-lens",
      lazy = true,
      config = function ()
        require("session-lens").setup()
      end,
      cmd = {"SearchSession"},
      keys = {
        {"<leader>sf", [[<cmd>lua require('session-lens').search_session()<CR>]], desc = "Find session"}
      }
    }
  },
  config = function()
    require("auto-session").setup {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
    }
  end,
  lazy = false,
  keys = {
    {"<leader>ss", ":SaveSession<CR>", desc = "Save session"},
  }
}

return M
