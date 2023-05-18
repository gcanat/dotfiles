local M = {
  "andymass/vim-matchup",
  enabled = false,
  event = "BufReadPost",
  config = function()
    vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
  end
}

return M
