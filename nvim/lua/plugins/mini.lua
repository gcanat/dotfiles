local M = {
  'echasnovski/mini.nvim',
  event = "VeryLazy",
  config = function ()
    require('mini.cursorword').setup()
    require('mini.pairs').setup()
    -- require('mini.fuzzy').setup()
    require("mini.statusline").setup({
      use_icons = true,
    })
    require('mini.indentscope').setup()
    require('mini.surround').setup(
      -- default config but here to show the keymaps
      {
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          add = 'gza', -- Add surrounding in Normal and Visual modes
          delete = 'gzd', -- Delete surrounding
          find = 'gzf', -- Find surrounding (to the right)
          find_left = 'gzF', -- Find surrounding (to the left)
          highlight = 'gzh', -- Highlight surrounding
          replace = 'gzr', -- Replace surrounding
          update_n_lines = 'gzn', -- Update `n_lines`

          suffix_last = 'l', -- Suffix to search with "prev" method
          suffix_next = 'n', -- Suffix to search with "next" method
        },
      }
    )
    require('mini.comment').setup({
      mappings = {
        comment = '<leader>c',
        comment_line = '<leader>cc',
        textobject = '<leader>c'
      }
    })
    -- require('mini.sessions').setup({
    --   autoread = true,
    -- })
    require('mini.tabline').setup({
      show_icons = false,
    })
    -- require('mini.base16').setup({
    --   palette = require('mini.base16').mini_palette('#24273a', '#cad3f5', 65),
    --   plugins = {
    --     default = true,
    --   }
    -- })    
  end
}
return M

