local M = {
  'glepnir/lspsaga.nvim',
  branch = 'main',
  cmd = "Lspsaga",
  init = function()
    local map_opts = { noremap = true, silent = true }
    -- Float terminal
    vim.keymap.set({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>", map_opts)
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
