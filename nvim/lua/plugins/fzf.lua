local M = {
  'ibhagwan/fzf-lua',
  enabled = false,
  cmd = "FzfLua",
  config = function ()
    require('fzf-lua').setup({
      -- 'fzf-native',
      previewers = {
        builtin = {
          extensions = {
            ["png"] = { "chafa" },
            ["jpg"] = { "chafa" },
            ["gif"] = { "chafa" },
          },
        },
      },
      -- winopts = { preview = { default = "bat" } }, -- if this is enabled, image preview wont work
      manpages = { previewer = "man_native" },
      helptags = { previewer = "help_native" },
      -- tags = { previewer = "bat" },
      -- btags = { previewer = "bat" },
    })
  end
}

-- function _G.gh_pr_test(opts)
--   local fzf = require('fzf-lua')
--   opts = fzf.config.normalize_opts(opts, fzf.config.globals.git)
--
--   opts.cmd = 'gh pr list --limit 300'
--
--   opts.actions = {
--     ["default"]  = {
--       function(sel)
--         local chunks = {}
--         for substring in sel:gmatch("%S+") do
--           table.insert(chunks, substring)
--         end
--         vim.cmd(":!gh pr checkout "..chunks[1])
--       end,
--       fzf.actions.resume
--     },
--   }
--
--   fzf.core.fzf_wrap(opts, opts.cmd, function(selected)
--     if not selected then return end
--     fzf.actions.act(opts.actions, selected, opts)
--   end)()
-- end

return M
