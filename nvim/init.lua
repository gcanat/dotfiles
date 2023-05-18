local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
    vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
  end
end
vim.opt.rtp:prepend(lazypath)

-- change leader key
vim.g.mapleader = ","
vim.g.maplocalleader = " "

vim.cmd([[
  if has('nvim') && executable('nvr')
    let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
  endif
]])


require("lazy").setup(
  "plugins",
  {
    defaults = {
      lazy = true
    },
    -- install = {
    --  colorscheme = {
    --    {"dracula"}
    --  }
    --},
    ui = {
      border = "rounded"
    },
    checker = {
      enabled = false
    },
    performance = {
      rtp = {
        disabled_plugins = {
          "gzip",
          "zip",
          "zipPlugin",
          -- "fzf",
          -- "tar",
          "tarPlugin",
          "tutor",
          "tohtml",
          -- "getscript",
          -- "getscriptPlugin",
          -- "vimball",
          -- "vimballPlugin",
          -- "2html_plugin",
          -- "matchit",
          -- "matchparen",
          -- "logiPat",
          -- "rrhelper",
          -- "netrw",
          "netrwPlugin",
          -- "netrwSettings",
          -- "netrwFileHandlers",
          -- "shada_plugin",
          -- "spellfile_plugin",
          -- "tutor_mode_plugin",
          -- "rrhelper",
          -- "remote_plugins",
        },
      }
    }
  }
)

-- all the setups that are pretty much oneliners go here
require('config') -- usual vim options

vim.cmd("colorscheme mycatmach")
-- vim.cmd("colorscheme minischeme")
-- vim.cmd("colorscheme catppuccin")

-- load settings from other files in lua/ dir
-- require('mapping') -- keymaps
require("commands")
require("mapping")

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "VeryLazy",
--   callback = function()
--     require("commands")
--     require("mapping")
--   end,
-- })
