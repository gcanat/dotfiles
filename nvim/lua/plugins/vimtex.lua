local M = {
  'lervag/vimtex',
  ft = {"tex", "plaintex", "bib"},
  config = function()
    -- vim.g.vimtex_latexmk_continuous=1
    vim.g.tex_flavor = "latex"
    vim.g.Tex_DefaultTargetFormat = "pdf"
    vim.g.vimtex_view_enabled = 1
    vim.g.vimtex_view_automatic = 1
    vim.g.vimtex_view_general_viewer = "zathura"
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_quickfix_mode = 0
  end
  -- config = function()
  -- end,
}

return M
