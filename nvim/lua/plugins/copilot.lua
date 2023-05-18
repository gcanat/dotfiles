local M = {
  'zbirenbaum/copilot.lua',
  event = "InsertEnter",
  dependencies = {
    {
      "zbirenbaum/copilot-cmp",
      config = function ()
        require("copilot_cmp").setup()
      end
    },
  },
  config = function()
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  end
}

-- local M = {
--   'github/copilot.vim',
--   event = 'InsertEnter',
-- }
--
-- return M
-- local M = {
--   'Exafunction/codeium.vim',
--   event = 'InsertEnter',
--   config = function ()
--     vim.keymap.set('i', '<C-f>', function ()
--       return vim.fn['codeium#Accept']()
--     end, { expr = true, noremap = true, nowait = true, desc = 'Accept Codeium suggestion' })
--   end
-- }
-- local M = {
--   "jcdickinson/codeium.nvim",
--   event = "InsertEnter",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "hrsh7th/nvim-cmp",
--   },
--   config = function()
--     require("codeium").setup({})
--   end
-- }

return M
