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
		"lervag/wiki.vim",
		lazy = true,
    cmd = {'WikiEnable', 'WikiIndex', 'WikiJournal', 'WikiOpen', 'WikiPages', 'WikiReload', 'WikiTags' },
		-- keys = {},
    config = function()
      vim.g.wiki_root = '~/wiki'
      local fzf = require "fzf-lua"
      local fzf_data = require "fzf-lua".config.__resume_data

      local function fzf_pages()
        fzf.files({
          prompt = "Wiki files>",
          cwd = vim.g.wiki_root,
          actions = {
            ['default'] = function(selected)
              local note = selected[1]
              if not note then
                if fzf_data.last_query then
                  note = fzf_data.last_query
                end
              end
              vim.fn["wiki#page#open"](note)
            end,
          }
        })
      end

      local function fzf_tags()
        local tags_with_locations = vim.fn["wiki#tags#get_all"]()
        local root = vim.fn["wiki#get_root"]()
        local items = {}
        for tag, locations in pairs(tags_with_locations) do
          for _, loc in pairs(locations) do
            local path = vim.fn["wiki#paths#relative"](loc[1], root)
            local str = string.format("%s:%d:%s", tag, loc[2], path)
            table.insert(items, str)
          end
        end
        fzf.fzf_exec(items, {
          actions = {
            ['default'] = function(selected)
              local note = vim.split(selected[1], ':')[3]
              if note then
                vim.fn["wiki#page#open"](note)
              end
            end
          }
        })
      end

      local function fzf_toc()
        local toc = vim.fn["wiki#toc#gather_entries"]()
        local items = {}
        for _, hd in pairs(toc) do
          local indent = vim.fn["repeat"](".", hd.level - 1)
          local line = indent .. hd.header
          table.insert(items, string.format("%d:%s", hd.lnum, line))
        end
        fzf.fzf_exec(items, {
          actions = {
            ['default'] = function(selected)
              local ln = vim.split(selected[1], ':')[1]
              if ln then
                vim.fn.execute(ln)
              end
            end
          }
        })
      end

      vim.g.wiki_select_method = {
        pages = fzf_pages,
        tags = fzf_tags,
        toc = fzf_toc,
      }
    end,
	},
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   ft = { "markdown" },
  --   build = function() vim.fn["mkdp#util#install"]() end,
  -- },
  -- {
  --   'MeanderingProgrammer/render-markdown.nvim',
  --   dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  --   ---@module 'render-markdown'
  --   ---@type render.md.UserConfig
  --   opts = {},
  -- }
  {
    "OXY2DEV/markview.nvim",
    lazy = true,
    ft = "markdown",
    branch = "main",

    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        -- "nvim-tree/nvim-web-devicons"
    },
    opts = {
      preview = {
        icon_provider = "mini"
      },
      latex = {
        enable = true,
      },
    },
  },
}

return M
