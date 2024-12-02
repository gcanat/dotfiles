-- Plugins related to prose writing
local M = {
	{
		"lervag/vimtex",
		ft = { "tex", "plaintex", "bib" },
		config = function()
			-- vim.g.vimtex_latexmk_continuous=1
			vim.g.tex_flavor = "latex"
			vim.g.Tex_DefaultTargetFormat = "pdf"
			vim.g.vimtex_view_enabled = 1
			vim.g.vimtex_view_automatic = 1
			vim.g.vimtex_view_general_viewer = "zathura"
			vim.g.vimtex_view_method = "zathura"
			-- vim.g.vimtex_view_general_viewer = "sioyek"
			-- vim.g.vimtex_view_method = "sioyek"
			vim.g.vimtex_quickfix_mode = 1
		end,
	},
	{
		"vimwiki/vimwiki",
		lazy = true,
		keys = {
			{ "<leader>ww", "<Plug>VimwikiIndex", desc = "VimwikiIndex" },
			{ "<leader>wt", "<Plug>VimwikiTabIndex", desc = "VimwikiTabIndex" },
			{ "<leader>wi", "<Plug>VimwikiDiaryIndex", desc = "VimwikiDiaryIndex" },
			{ "<leader>w<leader>w", "<Plug>VimwikiMakeDiaryNote", desc = "VimwikiMakeDiaryNote" },
			{ "<leader>w<leader>t", "<Plug>VimwikiTabMakeDiaryNote", desc = "VimwikiTabMakeDiaryNote" },
			{ "<Leader>w<Leader>y", "<Plug>VimwikiMakeYesterdayDiaryNote", desc = "VimwikiMakeYesterdayDiaryNote" },
			{ "<Leader>w<Leader>m", "<Plug>VimwikiMakeTomorrowDiaryNote", desc = "VimwikiMakeTomorrowDiaryNote" },
		},
	},
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
}

return M
