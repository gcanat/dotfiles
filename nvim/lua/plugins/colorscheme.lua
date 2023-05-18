-- local M = {
--   'Mofiqul/dracula.nvim',
--   lazy = true,
--   -- event = "ColorSchemePre",
--   priority = 1000
-- }
--
-- function M.config()
--   local dracula = require("dracula")
--   dracula.setup({
--     -- customize dracula color palette
--     colors = {
--       -- bg = "#282C34",
--       bg = "#24273A"
--       -- bg = "#000000",
--       -- fg = "#FFFFFF",
--       -- menu = "#282C34",
--     },
--     -- lualine_bg_color = "#282A36",
--     italic_comment = true,
--   })
--   vim.cmd("colorscheme dracula")
-- end

local M = {
  "catppuccin/nvim",
  enabled = false,
  name = "catppuccin",
  event = "ColorSchemePre",
  lazy = false,
  config = function ()
    require("catppuccin").setup({
      flavour = "macchiato",
      background = {
        dark = "macchiato"
      },
      integrations = {
        which_key = true,
      }
    })
    vim.cmd.colorscheme "catppuccin"

    local base1 = "#2D3145"

    local colors = require("catppuccin.palettes").get_palette()
    require("catppuccin.lib.highlighter").syntax({
      NormalFloat = { bg = base1 },
      CursorLine = { bg = colors.surface0 },
    })
  end
}

return M
