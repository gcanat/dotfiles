-- aliases
local map = vim.api.nvim_set_keymap  -- alias to easier keymapping
-- local fn = vim.fn
-- local cmd = vim.cmd  -- to execute Vim commands

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
    [[
    augroup Packer
        autocmd!
        autocmd BufWritePost init.lua PackerCompile
    augroup end
    ]],
    false
)

if vim.fn.has("mac") == 1 then
    vim.cmd [[language en_US]]
end

local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Package manager
    use 'tpope/vim-fugitive' -- Git commands in nvim
    -- use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
    use 'b3nj5m1n/kommentary' -- "gc" to comment visual regions/lines
    use 'ludovicchabant/vim-gutentags' -- Automatic tags management
    use 'nvim-lua/plenary.nvim'
    -- UI to select things (files, grep results, open buffers...)
    use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }
    use 'joshdick/onedark.vim' -- Theme inspired by Atom
    -- use 'itchyny/lightline.vim' -- Fancier statusline
    use 'hoob3rt/lualine.nvim'  -- even more fancier statusline
    -- tabline that goes along with lualine
    use { 'kdheepak/tabline.nvim', requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} } }
    use 'Vimjas/vim-python-pep8-indent' -- special plugin for python identation
    -- Add indentation guides even on blank lines
    use 'lukas-reineke/indent-blankline.nvim'
    -- Add git related info in the signs columns and popups
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use 'nvim-treesitter/nvim-treesitter'
    -- Additional textobjects for treesitter
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'hrsh7th/nvim-compe' -- Autocompletion plugin
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'windwp/nvim-autopairs'  -- autoclosing brackets, quotes etc.
    use 'hkupty/iron.nvim' -- repl plugin
    use 'kyazdani42/nvim-web-devicons'  -- fancy icons
    use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'} }  -- file tree browser
    use 'christoomey/vim-tmux-navigator'
    -- previewer for markdown files
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}
    use 'plasticboy/vim-markdown'
    use 'vim-pandoc/vim-pandoc-syntax'
    use 'mhartington/formatter.nvim'
    use 'lervag/vimtex'
end)

--Incremental live completion
vim.o.inccommand = 'nosplit'

--Set highlight on search
vim.o.hlsearch = true

--Make line numbers default
vim.wo.number = true

--Do not save when switching buffers
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.cmd [[set undofile]]

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- indentation
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.textwidth=79
-- Continue comment marker in new lines.
vim.opt.formatoptions:append('ro')

-- split as desired
vim.o.splitbelow = true -- Horizontal split below current.
vim.o.splitright = true -- Vertical split to right of current.

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- highlight current line and column but only for current window
vim.api.nvim_exec(
    [[
    augroup CursColLine
        autocmd!
        au WinLeave * setlocal nocursorline nocursorcolumn
        au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
    augroup end
    ]],
    false
)

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.cmd [[colorscheme onedark]]

-- disable show mode in command line because it's already displayed by status line
vim.o.showmode = false

--Set statusbar
-- vim.g.lightline = {
--   colorscheme = 'onedark',
--   active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
--   component_function = { gitbranch = 'fugitive#head' },
-- }

require('lualine').setup{
    options = {
        theme = 'onedark'
    },
    sections = {
        lualine_b = {'branch', 'diff'},
        lualine_y = {
            {
                'diagnostics',
                -- table of diagnostic sources, available sources:
                -- -- nvim_lsp, coc, ale, vim_lsp
                sources = {'nvim_lsp'},
                -- displays diagnostics from defined severity
                sections = {'error', 'warn', 'info', 'hint'},
                -- all colors are in format #rrggbb
                -- color_error = nil, -- changes diagnostic's error foreground color
                -- color_warn = nil, -- changes diagnostic's warn foreground color
                -- color_info = nil, -- Changes diagnostic's info foreground color
                -- color_hint = nil, -- Changes diagnostic's hint foreground color
                symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'}
            },
            'progress'
        }
    },
    extensions = {'nvim-tree', 'fugitive', 'quickfix'}
}

require'tabline'.setup {}


--Remap space as leader key
-- map('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ','
vim.g.maplocalleader = ';'

--Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Gitsigns
require('gitsigns').setup {
    signs = {
        add = { hl = 'GitGutterAdd', text = '+' },
        change = { hl = 'GitGutterChange', text = '~' },
        delete = { hl = 'GitGutterDelete', text = '_' },
        topdelete = { hl = 'GitGutterDelete', text = '‾' },
        changedelete = { hl = 'GitGutterChange', text = '~' },
    },
}

-- Telescope
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
}
--Add leader shortcuts
map('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
map('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
map('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
map('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
map('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
map('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
map('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
map('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
map('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })

-- Highlight on yank
vim.api.nvim_exec(
    [[
    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
    ]],
    false
)

-- Y yank until the end of line
map('n', 'Y', 'y$', { noremap = true })

-- LSP settings
local nvim_lsp = require 'lspconfig'

local border = {
    {"🭽", "FloatBorder"},
    {"▔", "FloatBorder"},
    {"🭾", "FloatBorder"},
    {"▕", "FloatBorder"},
    {"🭿", "FloatBorder"},
    {"▁", "FloatBorder"},
    {"🭼", "FloatBorder"},
    {"▏", "FloatBorder"},
}

-- LSP settings
local on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border})
    vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border})

    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
    --vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Enable the following language servers
-- local servers = { 'clangd', 'rust_analyzer', 'jedi_language_server', 'tsserver', 'r_language_server' }
--[[ local servers = { 'jedi_language_server', 'r_language_server' }

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end ]]

-- enable python language server
--[[ nvim_lsp['pyright'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "off",
                useLibraryCodeForTypes = true,
                -- stubPath = "/home/gui/typings"
            }
        }
    }
} ]]

require'lspconfig'.jedi_language_server.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

-- enable R language server
nvim_lsp['r_language_server'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- enable java language server
local jls_root_path = vim.fn.getenv("HOME") .. "/.config/nvim/java-language-server"

nvim_lsp['java_language_server'].setup{
    cmd = {jls_root_path .. "/dist/lang_server_linux.sh"},
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "java" }
    -- regarding root_dir settings,
    -- apparently having a `.git` dir in the project is enough
}

-- lua language server
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end
local sumneko_root_path = vim.fn.getenv("HOME") .. '/.config/nvim/lua-language-server' -- Change to your sumneko root installation
local sumneko_binary = sumneko_root_path .. '/bin/' .. system_name .. '/lua-language-server'

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

nvim_lsp['sumneko_lua'].setup {
    cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim', 'DATA_PATH' },
                disable = {'undefined-global'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                -- library = vim.api.nvim_get_runtime_file('', true),
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                },
                maxPreload = 50000,
                preloadFileSize = 25000,
                checkThirdParty = false,  -- disable autodetection of 3rd party projects
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

-- autoformat
vim.api.nvim_exec(
    [[
    augroup AutoFormat
        autocmd!
        autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
        autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
    augroup end
    ]],
    false
)
-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true, -- false will disable the whole extension
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
        },
    },
    indent = {
        enable = true,
        disable = {"python"},
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
    },
}

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noinsert,noselect'

-- Compe setup
require('compe').setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;
    source = {
        path = true,
        nvim_lsp = true,
        luasnip = true,
        buffer = false,
        calc = false,
        nvim_lua = false,
        vsnip = false,
        ultisnips = false,
    },
}

-- Utility functions for compe and luasnip
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col '.' - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
local luasnip = require 'luasnip'

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t '<C-n>'
    elseif luasnip.expand_or_jumpable() then
        return t '<Plug>luasnip-expand-or-jump'
    elseif check_back_space() then
        return t '<Tab>'
    else
        return vim.fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t '<C-p>'
    elseif luasnip.jumpable(-1) then
        return t '<Plug>luasnip-jump-prev'
    else
        return t '<S-Tab>'
    end
end

-- Map tab to the above tab complete functiones
map('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
map('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
map('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
map('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })

-- Map compe confirm and complete functions
map('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
map('i', '<c-space>', 'compe#complete()', { expr = true })


vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=grey guibg=#1f2335]]



require('vim.lsp.protocol').CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '了', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
}


-- Change diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Show line diagnostics automatically in hover window
-- vim.o.updatetime = 250
-- cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]

-- Go-to definition in a split window
local function goto_definition(split_cmd)
    local util = vim.lsp.util
    local log = require("vim.lsp.log")
    local api = vim.api

    local handler = function(_, method, result)
        if result == nil or vim.tbl_isempty(result) then
            local _ = log.info() and log.info(method, "No location found")
            return nil
        end

        if split_cmd then
            vim.cmd(split_cmd)
        end

        if vim.tbl_islist(result) then
            util.jump_to_location(result[1])
            if #result > 1 then
                util.set_qflist(util.locations_to_items(result))
                api.nvim_command("copen")
                api.nvim_command("wincmd p")
            end
        else
            util.jump_to_location(result)
        end
    end

    return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition('split')

-- iron.nvim config
local iron = require('iron')

iron.core.add_repl_definitions {
    python = {
        mycustom = {
            command = {"python3"}
        }
    },
    clojure = {
        lein_connect = {
            command = {"lein", "repl", ":connect"}
        }
    }
}

iron.core.set_config {
    preferred = {
        python = "ipython",
        clojure = "lein"
    },
    repl_open_cmd = "90vsplit",
}

_G.my_iron_open_fn = function(orientation)
    local old_config = iron.config.repl_open_cmd
    iron.core.set_config{repl_open_cmd = orientation}
    iron.core.repl_for(vim.api.nvim_buf_get_option(0, "ft"))
    iron.core.set_config{repl_open_cmd = old_config}
end

-- iron.nvim mappings
local mapopts = { noremap = false }
map('n', '<leader>ct', '<Plug>(iron.iron-send-motion)', mapopts)
map('v', '<leader>cv', '<Plug>(iron-visual-send)', mapopts)
map('n', '<leader>cr', '<Plug>(iron-repeat-cmd)', mapopts)
map('n', '<leader>cl', '<Plug>(iron-send-line)', mapopts)
map('n', '<leader>c<CR>', '<Plug>(iron-cr)', mapopts)
map('n', '<leader>ci', '<Plug>(iron-interrupt)', mapopts)
map('n', '<leader>cq', '<Plug>(iron-exit)', mapopts)
map('n', '<leader>cc', '<Plug>(iron-clear)', mapopts)
-- remap the key to exit insert mode in terminal
map('t', '<leader><Esc>', '<C-\\><C-n>', {noremap = true, silent = true})

-- allow terminal width to dynamically adjust
-- autocmd BufLeave * if &buftype == 'terminal' | :set nowfw | endif
--
require'nvim-tree'.setup {
  -- disables netrw completely
  disable_netrw       = true,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- open the tree when running this setup function
  open_on_setup       = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {},
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close          = false,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = false,
  -- hijacks new directory buffers when they are opened.
  update_to_buf_dir   = { enable = true, auto_open = true },
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually) 
  update_cwd          = false,
  -- show lsp diagnostics in the signcolumn
  diagnostics     = { enable = true },
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`
    width = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    }
  },

  filters = {
	dotfiles = true,
	custom = {
      '.git', 'node_modules', '.cache', '.pyc', '.pyo', '__pycache__', '.ipynb_checkpoints'
    }
  }
}

-- vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache', '.pyc', '.pyo', '__pycache__', '.ipynb_checkpoints'}
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_add_trailing = 1 -- 0 by default, append a trailing slash to folder names
-- vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_special_files = {
	['README.md'] = 1,
	['Makefile'] = 1,
	['MAKEFILE'] = 1
}
vim.g.nvim_tree_show_icons = {
	['git']= 1,
	['folders']= 1,
	['files']= 1,
	['folder_arrows']= 0,
}

map('n', '<F3>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- tab navigation mappings
map('n', 'tt', ':tabnew', { noremap = true, silent = true })
map('n', '<M-Right>', ':tabn<CR>', { noremap = true, silent = true })
map('i', '<M-Right>', '<ESC>:tabn<CR>', { noremap = true, silent = true })
map('n', '<M-Left>', ':tabp<CR>', { noremap = true, silent = true })
map('i', '<M-Left>', '<ESC>:tabp<CR>', { noremap = true, silent = true })
-- Search and Replace
map('n', '<Leader>s', ':%s//g<Left><Left>', {noremap = false, silent = true})

-- nvim autopairs setup
require('nvim-autopairs').setup()
require("nvim-autopairs.completion.compe").setup({
  map_cr = false, --  map <CR> on insert mode
  map_complete = true -- it will auto insert `(` after select function or method item
})


-- vim.markdown options
-- disable header folding
vim.g.vim_markdown_folding_disabled = 1
-- do not use conceal feature, the implementation is not so good
vim.g.vim_markdown_conceal = 0
-- disable math tex conceal feature
vim.g.tex_conceal = ""
vim.g.vim_markdown_math = 1
-- support front matter of various format
vim.g.vim_markdown_frontmatter = 1  -- for YAML format
vim.g.vim_markdown_toml_frontmatter = 1  -- for TOML format
vim.g.vim_markdown_json_frontmatter = 1  -- for JSON format

-- markdown pandoc standalone usage
-- vim.api.nvim_exec(
    -- [[
    -- augroup pandoc_syntax
        -- au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
    -- augroup end
    -- ]],
    -- false
-- )

-- formatter.nvim
require('formatter').setup({
  filetype = {
    python = {
      -- Configuration for psf/black
      function()
        return {
          exe = "black", -- this should be available on your $PATH
          args = { '-' },
          stdin = true,
        }
      end
    }
  }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.py,*.R FormatWrite
augroup END
]], true)

vim.api.nvim_set_keymap('n', '<leader>f', ':Format<CR>', {})
