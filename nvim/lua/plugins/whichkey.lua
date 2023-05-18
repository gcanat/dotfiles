local M = {
  'folke/which-key.nvim',
  event = "VeryLazy",
  config = function()
    vim.o.timeoutlen = 300
    local wk = require("which-key")
    wk.setup({
      window = {
        border = "single",
      },
    })
    local keymaps = {
      mode = { "n" },
      ["g"] = { name = "+goto" },
      ["gz"] = { name = "+surround" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader>c"] = { name = "+comment" },
      ["<leader>d"] = { name = "+debug" },
      ["<leader>f"] = { name = "+files/find" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>h"] = { name = "+hunk" },
      ["<leader>l"] = { name = "+lsp" },
      ["<leader>n"] = { name = "+neogen" },
      ["<leader>q"] = { name = "+quarto" },
      ["<leader>s"] = { name = "+session" },
      ["<leader>t"] = { name = "+test" },
      ["<space>w"] = { name = "+workspaces" },
      ["<LocalLeader>m"] = { name = "+magma"},
    }
    wk.register(keymaps)
  end,
}

return M
