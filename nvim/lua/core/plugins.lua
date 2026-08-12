function FindFiles(cmdarg, _cmdcomplete)
  local fnames = vim.fn.systemlist("rg --files --color=never ")
  if #cmdarg == 0 then
    return fnames
  else
    return vim.fn.matchfuzzy(fnames, cmdarg)
  end
end

vim.opt.findfunc = "v:lua.FindFiles"

-- diffs.nvim
vim.g.diffs = {
  integrations = {
    fugitive = true,
    neogit = false,
    neojj = false,
    gitsigns = true,
  }
}

vim.pack.add({
  "https://github.com/rebelot/kanagawa.nvim",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

local languages = {
  'c',
  'cpp',
  'fish',
  'gitignore',
  'python',
  'ron',
  'rust',
  'toml',
  'yaml',
}
local isnt_installed = function(lang)
  return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
end
local to_install = vim.tbl_filter(isnt_installed, languages)
if #to_install > 0 then require('nvim-treesitter').install(to_install) end

-- Enable tree-sitter after opening a file for a target language
local filetypes = {}
for _, lang in ipairs(languages) do
  for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
    table.insert(filetypes, ft)
  end
end

local ts_start = function(ev) vim.treesitter.start(ev.buf) end
local ts_au = vim.api.nvim_create_augroup('ts_start',  {})
vim.api.nvim_create_autocmd('FileType', {
  group = ts_au,
  pattern = filetypes,
  callback = ts_start,
  desc = 'Start tree-sitter'
})

require("kanagawa").setup({
  compile = true, -- enable compiling the colorscheme
  undercurl = true, -- enable undercurls
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = true, -- do not set background color
  dimInactive = false, -- dim inactive window `:h hl-NormalNC`
  terminalColors = true, -- define vim.g.terminal_color_{0,17}
  colors = {
    palette = {},
    theme = { wave = {}, lotus = {}, dragon = {}, all = { ui = { bg_gutter = "none" } } },
  },
  theme = "wave", -- Load "wave" theme when 'background' option is not set
  background = { -- map the value of 'background' option to a theme
    dark = "wave",
    light = "lotus",
  },
})

vim.cmd("colorscheme kanagawa")

vim.defer_fn(function()
  vim.pack.add({
    "https://github.com/nvim-mini/mini.completion",
    "https://github.com/tpope/vim-fugitive",
    -- {src = "https://github.com/gcanat/guh.nvim", version = "dev" },
    "https://github.com/barrettruth/diffs.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/dangooddd/pyrepl.nvim",
    "https://github.com/3rd/image.nvim",
  })

  -- autocompletion module
  require('mini.completion').setup({
    lsp_completion = { source_func = 'omnifunc', auto_setup = false },
    -- mappings = {
    --   scroll_down = '<C-f>',
    --   scroll_up = '<C-b>',
    -- },
  })


  require('fzf-lua').setup{
    previewers = { builtin = { extensions = {
      ["svg"] = { "chafa", "{file}" },
      ["png"] = { "chafa", "{file}" },
      ["jpeg"] = { "chafa", "{file}" },
      ["jpg"] = { "chafa", "{file}" },
      ["gif"] = { "chafa", "{file}" },
    } } }
  }

  local get_pr_num = function(selection)
    local pr_num = vim.split(selection[1], '%s+')[1]:match("^#?(%d+)$")
    if not pr_num then vim.notify('PR number not found', vim.log.levels.ERROR) end
    return pr_num
  end

  vim.api.nvim_create_user_command("FzfPRlist", function(opts)
    local preview_cmd = 'GH_FORCE_TTY=True gh pr view --comments {1}'
    local diff_cmd = 'GH_FORCE_TTY=$FZF_PREVIEW_COLUMNS gh pr diff {1}'

    require'fzf-lua'.fzf_exec('gh pr list -S "is:pr is:open sort:updated-desc" --limit=1000', {
      winopts = { height=0.90, width=0.85 },
      prompt = 'PR list> ',
      fzf_opts = {
        ['--ansi'] = true,
        ['--reverse'] = true,
        ['--preview'] = preview_cmd,
        ['--info'] = 'inline',
        ['--style'] = 'minimal',
        ['--header'] = '> ENTER (pr review) CTRL-R (checkout pr) CTRL-D (diff) CTRL-F (description)',
      },
      actions = {
        ['default'] = function(selection)
          local pr_num = get_pr_num(selection)
          vim.cmd('Guh ' .. pr_num)
        end,
        ['ctrl-r'] = function(selection)
          local pr_num = get_pr_num(selection)
          vim.cmd('!gh pr checkout ' .. pr_num)
        end,
        ['ctrl-d'] = { fn = function(_)
          vim.notify('Changing preview to diff')
        end,
        exec_silent = true,
        postfix = 'preview:' .. diff_cmd,
        },
        ['ctrl-f'] = { fn = function(_)
          vim.notify('Changing preview to PR summary')
        end,
        exec_silent = true,
        postfix = 'preview:' .. preview_cmd,
        },
      },
    })
  end)

  require('gitsigns').setup{
    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal({']c', bang = true})
        else
          gitsigns.nav_hunk('next')
        end
      end)

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal({'[c', bang = true})
        else
          gitsigns.nav_hunk('prev')
        end
      end)

      -- Actions
      map('n', '<leader>hs', gitsigns.stage_hunk)
      map('n', '<leader>hr', gitsigns.reset_hunk)

      map('v', '<leader>hs', function()
        gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end)

      map('v', '<leader>hr', function()
        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end)

      map('n', '<leader>hS', gitsigns.stage_buffer)
      map('n', '<leader>hR', gitsigns.reset_buffer)
      map('n', '<leader>hp', gitsigns.preview_hunk)
      map('n', '<leader>hi', gitsigns.preview_hunk_inline)

      map('n', '<leader>hb', function()
        gitsigns.blame_line({ full = true })
      end)

      map('n', '<leader>hd', gitsigns.diffthis)

      map('n', '<localleader>dm', function()
        gitsigns.diffthis('~')
      end)

      map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
      map('n', '<leader>hq', gitsigns.setqflist)

      -- Toggles
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
      map('n', '<leader>tw', gitsigns.toggle_word_diff)

      -- Text object
      map({'o', 'x'}, 'ih', gitsigns.select_hunk)
    end
  }

  require("image").setup({ backend = "sixel" })

  local pyrepl = require("pyrepl")
  pyrepl.setup({ image_provider = "image" })
  vim.keymap.set("n", "<localleader>jo", pyrepl.open_repl)
  vim.keymap.set("n", "<localleader>jh", pyrepl.hide_repl)
  vim.keymap.set("n", "<localleader>jc", pyrepl.close_repl)
  vim.keymap.set("n", "<localleader>jt", pyrepl.toggle_repl)
  vim.keymap.set("n", "<localleader>ji", pyrepl.open_image_history)
  vim.keymap.set({ "n", "t" }, "<C-j>", pyrepl.toggle_repl_focus)

  -- send commands
  vim.keymap.set("n", "<localleader>jb", pyrepl.send_buffer)
  vim.keymap.set("n", "<localleader>jl", function()
    pyrepl.send_cell()
    pyrepl.step_cell_forward()
  end)
  vim.keymap.set("v", "<localleader>jv", pyrepl.send_visual)

  -- QoL commands
  vim.keymap.set("n", "<localleader>jp", pyrepl.step_cell_backward)
  vim.keymap.set("n", "<localleader>jn", pyrepl.step_cell_forward)
  vim.keymap.set("n", "<localleader>je", pyrepl.export_to_notebook)
  vim.keymap.set("n", "<localleader>js", ":PyreplInstall")

end, 100)
