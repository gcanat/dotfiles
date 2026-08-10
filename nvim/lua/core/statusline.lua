local function applyHl(str, hlGroup)
  return "%#" .. hlGroup .. "#" .. str .. "%*"
end

vim.g.gitstatus = ''

local function get_gitstatus()
  local git_output = vim.fn.systemlist('cd ' .. vim.fn.expand('%:p:h:S') .. ' 2>/dev/null && git status -s 2>/dev/null')
  local git_branch = vim.fn.system('cd ' .. vim.fn.expand('%:p:h:S') .. ' 2>/dev/null && git branch --show-current 2>/dev/null | tr -d "\n"')

  if #git_branch > 0 then
    vim.g.gitstatus = applyHl('.' .. git_branch .. '/' .. string.sub(git_output[1] or ' ', 1, 2), "PMenuSel")
  else
    vim.g.gitstatus = ''
  end
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  callback = function()
    vim.defer_fn(get_gitstatus, 250)
  end
})

---Show attached LSP clients in `[name1, name2]` format.
---Long server names will be modified. For example, `lua-language-server` will be shorten to `lua-ls`
---Returns an empty string if there aren't any attached LSP clients.
---@return string
local function lsp_status()
  local attached_clients = vim.lsp.get_clients({ bufnr = 0 })
  if #attached_clients == 0 then
    return ""
  end
  local names = vim.iter(attached_clients)
    :map(function(client)
      local name = client.name:gsub("language.server", "ls")
      return name
    end)
    :totable()
  return "LSP: " .. table.concat(names, ", ")
end

local current_mode = { n = 'NORMAL', no = 'N·OP·PEND', v = 'VISUAL', V = 'V·LINE', s = 'SELECT', S = 'S·LINE', i = 'INSERT', R = 'REPLACE', Rv = 'V·REPLACE', c = 'COMMAND', cv = 'VIM EX', ce = 'EX', r = 'PROMPT', rm = 'MORE', t = 'TERMINAL' } -- '' = 'V·BLOCK',  = 'S·BLOCK', r? = 'CONFIRM', ! = 'SHELL', }

local hl_mode = { NORMAL = 'DiffAdd', INSERT = 'IncSearch', VISUAL = 'DiffChange', REPLACE = 'DiffDelete', COMMAND = 'DiffText' }

local function get_mode()
  local curr_mode = vim.fn.toupper(current_mode[vim.fn.mode()])
  local hl_group = hl_mode[curr_mode]
  if hl_group ~= nil then
    return applyHl(" " .. curr_mode .. " ", hl_group)
  else
    return applyHl(" " .. curr_mode .. " ", 'Cursor')
  end
end

function _G.statusline()
  return table.concat({
    get_mode(),
    vim.g.gitstatus,
    " %f ",
    "%h%w%m%r ",
    vim.diagnostic.status(),
    " %= ",
    lsp_status(),
    " %#PMenuSel# %y %{&fileencoding?&fileencoding:&encoding} ",
    "[%{&fileformat}] %p%% %l:%c "
  }, "")
end

vim.o.statusline = "%{%v:lua._G.statusline()%}"
