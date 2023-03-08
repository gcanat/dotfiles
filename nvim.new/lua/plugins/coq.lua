local M = {
  'ms-jpq/coq_nvim',
  branch = 'coq',
  event = "BufReadPost",
  -- lazy = false,

  config = function()
  --   vim.api.nvim_exec([[COQnow]], false)
    local map = vim.api.nvim_set_keymap
    map('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
    map('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
    map('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
    map('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })
  end,
  dependencies = {
    { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
    {
      'ms-jpq/coq.thirdparty',
      branch = '3p',
      config = function()
        require("coq_3p") {
          { src = "nvimlua", short_name = "nLUA" },
          -- { src = "copilot", short_name = "COP", accept_key = "<c-f>" },
        }
      end
    },
  }
}

return M
