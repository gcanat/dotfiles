local M = {
  "danymat/neogen", 
  dependencies = "nvim-treesitter/nvim-treesitter", 
  lazy = true,
  opts = {
    snippet_engine = "luasnip",
    languages = {
      python = {
        template = {
          annotation_convention = "reST"
        }
      }
    }
  },
  keys = {
    {"<Leader>nf", ":lua require('neogen').generate()<CR>", desc = "Neogen generate doc"}
  }
}

return M
