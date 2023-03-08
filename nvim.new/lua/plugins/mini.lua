local M = {
  'echasnovski/mini.nvim',
  event = "VeryLazy",
}


function M.comment()
  require('mini.comment').setup({
    mappings = {
      comment = '<leader>c',
      comment_line = '<leader>cc',
      textobject = '<leader>c'
    }
  })
end

-- function M.completion()
--   require('mini.completion').setup()
-- end

function M.cursor()
  require('mini.cursorword').setup()
end

function M.fuzzy()
  require('mini.fuzzy').setup()
end

function M.indentscope()
  require('mini.indentscope').setup()
end

function M.surround()
  require('mini.surround').setup(
    -- default config but here to show the keymaps
    {
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        add = 'sa', -- Add surrounding in Normal and Visual modes
        delete = 'sd', -- Delete surrounding
        find = 'sf', -- Find surrounding (to the right)
        find_left = 'sF', -- Find surrounding (to the left)
        highlight = 'sh', -- Highlight surrounding
        replace = 'sr', -- Replace surrounding
        update_n_lines = 'sn', -- Update `n_lines`

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
    }
  )
end


function M.config()
  M.comment()
  M.cursor()
  -- M.completion()
  M.fuzzy()
  M.indentscope()
  M.surround()
end

return M

