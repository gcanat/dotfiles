local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim"
  },
  lazy = true,
  config = function ()
    require("neotest").setup({
      adapters = {
        require("neotest-python")
      }
    })
  end,
  keys = {
    {"<leader>tn", "<cmd>lua require('neotest').run.run()<CR>", desc = "Run nearest test"},
    {"<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", desc = "Run current file"},
    {"<leader>td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>", desc = "Debug nearest test"},
    {"<leader>ts", "<cmd>lua require('neotest').run.stop()<CR>", desc = "Stop current test"},
    {"<leader>ta", "<cmd>lua require('neotest').run.attach()<CR>", desc = "Attach current test"},
    {"<leader>tu", "<cmd>lua require('neotest').summary.toggle()<CR>", desc = "Toggle test summary"},
    {"<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<CR>", desc = "Open output"},
  }
}

return M
