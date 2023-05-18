local M = {
  'WhiteBlackGoose/magma-nvim-goose',
  enabled = true,
  branch = "main",
  build = ':UpdateRemotePlugins',
  lazy = true,
  keys = {
    {"<LocalLeader>ma", ":MagmaInit<CR>", desc = "Init Magma"},
    {"<LocalLeader>ml", ":MagmaEvaluateLine<CR>", desc = "Evaluate line"},
    {"<LocalLeader>m", ":<C-u>MagmaEvaluateVisual<CR>", mode = "x", desc = "Evaluate visual"},
    {"<LocalLeader>mr", ":MagmaReevaluateCell<CR>", desc = "Reevaluate cell"},
    {"<LocalLeader>mo", ":MagmaShowOutput<CR>", desc = "Show cell output"},
    {"<LocalLeader>me", ":noautocmd MagmaEnterOutput<CR>", desc= "Enter output window"},
    {"<LocalLeader>mi", "<cmd>JupyterInspect<CR>", desc = "Inspect object in kernel"},
  }
}

return M
