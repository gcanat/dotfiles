return {
  "sindrets/diffview.nvim",
  dependencies = {'nvim-lua/plenary.nvim'},
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory", "DiffviewRefresh" },
  config = function ()
    require("diffview").setup()
  end
}