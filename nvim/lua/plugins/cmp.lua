return {
  -- completion
  { 'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    version = false,
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      -- { 'hrsh7th/cmp-calc' },
      -- { 'hrsh7th/cmp-emoji' },
      { 'saadparwaiz1/cmp_luasnip' },
      -- { 'f3fora/cmp-spell' },
      { 'ray-x/cmp-treesitter' },
      -- { 'kdheepak/cmp-latex-symbols' },
      -- { 'jc-doyle/cmp-pandoc-references' },
      -- { 'jmbuhr/cmp-pandoc-references' },
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
      { 'onsails/lspkind-nvim' },
      -- { "KadoBOT/cmp-plugins",
      --   config = function()
      --     require("cmp-plugins").setup({
      --       files = { "plugins.lua" } -- Recommended: use static filenames or partial paths
      --     })
      --   end,
      -- },
      -- {
      --   'windwp/nvim-autopairs',
      --   config = function()
      --     require('nvim-autopairs').setup {}
      --     local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      --     local cmp = require('cmp')
      --     cmp.event:on(
      --       'confirm_done',
      --       cmp_autopairs.on_confirm_done()
      --     )
      --   end,
      -- },
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local lspkind = require "lspkind"
      lspkind.init()

      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
      end

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<C-f>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-h>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s", "n" }),
          ['<C-H>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s", "n" }),
          ['<c-a>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          -- ['<CR>'] = cmp.mapping.confirm({
          --   behavior = cmp.ConfirmBehavior.Replace,
          --   select = false,
          -- }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
            -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          -- ["<Tab>"] = vim.schedule_wrap(function(fallback)
          --   if cmp.visible() and has_words_before() then
          --     cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          --   -- elseif cmp.visible() then
          --   --   cmp.select_next_item()
          --   -- elseif has_words_before() then
          --   --   cmp.complete()
          --   else
          --     fallback()
          --   end
          -- end),
          -- ["<S-Tab>"] = vim.schedule_wrap(function(fallback)
          --   if cmp.visible() then
          --     cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          --   else
          --     fallback()
          --   end
          -- end),
          -- ["<Tab>"] = cmp.mapping(function(fallback)
          --   if cmp.visible() then
          --     cmp.select_next_item()
          --   elseif has_words_before() then
          --     cmp.complete()
          --   else
          --     fallback()
          --   end
          -- end, { "i", "s" }),
          -- ["<S-Tab>"] = cmp.mapping(function(fallback)
          --   if cmp.visible() then
          --     cmp.select_prev_item()
          --   else
          --     fallback()
          --   end
          -- end, { "i", "s" }),
        },
        autocomplete = false,
        formatting = {
          format = lspkind.cmp_format {
            with_text = true,
            menu = {
              otter = "[otter]",
              luasnip = "[snip]",
              nvim_lsp = "[LSP]",
              buffer = "[buf]",
              path = "[path]",
              spell = "[spell]",
              pandoc_references = "[ref]",
              tags = "[tag]",
              treesitter = "[TS]",
              calc = "[calc]",
              latex_symbols = "[tex]",
              emoji = "[emoji]",
              -- codeium = "[]"
              Copilot = "",
              jupyter = "[jup]",
            },
          },
        },
        sources = {
          { name = 'otter' },
          { name = 'path' },
          { name = 'plugins' },
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'luasnip', keyword_length = 2, max_item_count = 4 },
          { name = "jupyter"},
          { name = 'pandoc_references' },
          { name = 'buffer', keyword_length = 3, max_item_count = 3 },
          { name = 'spell' },
          { name = 'treesitter', keyword_length = 3, max_item_count = 3 },
          { name = 'calc' },
          { name = 'latex_symbols' },
          { name = 'emoji' },
          -- { name = "codeium", keyword_length = 3, max_item_count = 3},
          { name = "copilot", keyword_length = 3, max_item_count = 3 },
        },
        view = {
          entries = "native",
        },
        window = {
          documentation = {
            -- border = require 'misc.style'.border,
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          },
        },
      })
      -- for friendly snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      -- for custom snippets
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snips" } })

    end
  },
}
