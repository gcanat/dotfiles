local M = {
  'nvim-treesitter/nvim-treesitter',
  dev = false,
  build = ":TSUpdate",
  event = "BufReadPost",
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    { 
      'nvim-treesitter/nvim-treesitter-context',
      config = function ()
        require'treesitter-context'.setup{}
      end,
    },
  }
}

function M.config()
  require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "python", "markdown", "vim", "c", "yaml" },
    highlight = { enable = true },
    indent = { enable = true },
    textobjects = {
      select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = {query = "@function.outer", desc = "Select outer part of a function"},
          ["if"] = {query = "@function.inner", desc = "Select inner part of a function"},
          ["ac"] = {query = "@class.outer", desc = "Select outer part of a class"},
          ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
        },
        -- You can choose the select mode (default is charwise 'v')
        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@function.outer'] = 'V', -- linewise
          ['@class.outer'] = '<c-v>', -- blockwise
        },
        -- If you set this to `true` (default is `false`) then any textobject is
        -- extended to include preceding xor succeeding whitespace. Succeeding
        -- whitespace has priority in order to act similarly to eg the built-in
        -- `ap`.
        include_surrounding_whitespace = false,
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]c]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]C"] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[c"] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[C"] = "@class.outer",
        },
      },
      lsp_interop = {
        enable = true,
        border = 'none',
        peek_definition_code = {
          ["<leader>df"] = "@function.outer",
          ["<leader>dF"] = "@class.outer",
        },
      },
    },
  }

  require("nvim-treesitter.configs").setup {
    yati = { enable = true },
  }
end

return M
