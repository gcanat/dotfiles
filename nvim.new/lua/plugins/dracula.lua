local M = {
  'Mofiqul/dracula.nvim',
  lazy = true,
  event = "ColorSchemePre"
}

function M.config()
  local dracula = require("dracula")
  dracula.setup({
    -- customize dracula color palette
    colors = {
      bg = "#282C34",
      -- bg = "#000000",
      -- fg = "#FFFFFF",
      -- menu = "#282C34",
    },
    -- lualine_bg_color = "#282A36",
    italic_comment = true,
  })
  vim.cmd("colorscheme dracula")
end

return M
