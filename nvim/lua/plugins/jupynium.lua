local M = {
  "kiyoon/jupynium.nvim",
  enabled = false,
  build = "pip3 install --user .",
  config = function()
    require("jupynium").setup({
      -- python_host = "/usr/bin/python3.10"
    })
  end,
  cmd = { "JupyniumStartAndAttachToServer", "JupyniumStartSync", "JupyniumAttachToServer" }
}

return M
