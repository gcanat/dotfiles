-- local M = {
--   'zbirenbaum/copilot.lua',
--   event = "InsertEnter",
--   config = function()
--     require("copilot").setup()
--   end
-- }

-- local M = {
--   'github/copilot.vim',
--   event = 'InsertEnter',
-- }
--
-- return M
local M = {
  'Exafunction/codeium.vim',
  event = 'InsertEnter',
  config = function ()
    vim.keymap.set('i', '<C-f>', function ()
      return vim.fn['codeium#Accept']()
    end, { expr = true, noremap = true, nowait = true, desc = 'Accept Codeium suggestion' })
  end
}

return M
