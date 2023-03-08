local M = {
  'nvim-lualine/lualine.nvim',
  event = "VeryLazy",
}

function M.config()
  require("lualine").setup({
    options = {
      theme = "material",
      -- theme = "tokyonight",
    },
    extensions = { "neo-tree", "quickfix" },
    -- sections = {
    --   lualine_b = {'branch', require('github-notifications').statusline_notification_count,  'diff', 'diagnostics' },
    -- }
  })
end

return M
