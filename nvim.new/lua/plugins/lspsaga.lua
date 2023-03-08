local M = {
  'glepnir/lspsaga.nvim',
  branch = 'main',
  cmd = "Lspsaga",
  init = function()
    local map_opts = { noremap = true, silent = true }
    -- Float terminal
    vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", map_opts)
    vim.keymap.set("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], map_opts)
  end,
  config = function()
    require('lspsaga').setup({
      symbol_in_winbar = {
        enable = true,
      }
      })
  end
}

return M
