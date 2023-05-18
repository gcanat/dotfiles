local M = {
  'ojroques/nvim-osc52',
  enabled = false,
  branch = 'main',
  lazy = true,
  config = function()
    require('osc52').setup({
      max_length = 0,
      silent = false,
      trim = false,
    })
  end,
  -- keys = {
  --   {"<leader>yo", ":lua require('osc52').copy_operator()<CR>", desc = "OSC copy"},
  --   {"<leader>yl", "<leader>yo_", mode = "n", remap = true, desc = "OSC copy line"},
  --   {"<leader>yo", ":lua require('osc52').copy_visual()<CR>", mode = "v", desc = "OSC copy selection"},
  -- }
}


return M
