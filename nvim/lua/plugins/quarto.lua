local M = {
  'quarto-dev/quarto-nvim',
  -- version = '0.7.3',
  lazy = true,
  dependencies = {
    {
      'jmbuhr/otter.nvim',
      -- version = '0.8.1',
      config = function ()
        require 'otter.config'.setup()
        require('otter').activate({ 'r', 'python', 'lua' }, true)
      end,
    },
    'hrsh7th/nvim-cmp',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter'
  },
  ft = {"md", "qmd"},
  cmd = "QuartoPreview",
  config = function()
    require 'quarto'.setup {
      lspFeatures = {
        enabled = true,
        languages = { 'r', 'python', 'julia' },
        diagnostics = {
          enabled = true,
          triggers = { "BufWrite" }
        },
        completion = {
          enabled = true
        }
      }
    }
  end,
  keys = {
    {"<LocalLeader>qp", ":lua require'quarto'.quartoPreview()<cr>", desc = "Quarto Preview"},
  }
}

return M
