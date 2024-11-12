-- local enderpy_path = "/home/guillaume/git_repos/enderpy"
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "python",
--   callback = function()
--     vim.lsp.start({
--       name = "enderpy",
--       cmd = {enderpy_path .. "/target/release/enderpy-lsp"},
--     })
--   end,
-- })
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

-- highlight current line and column but only for current window
vim.api.nvim_exec(
	[[
  augroup CursColLine
    autocmd!
    au WinLeave * setlocal nocursorline
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  augroup end
  ]],
	false
)

-- nfo file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.nfo", "*.NFO" },
	command = "set ft=nfo",
})

-- ipynb file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.ipynb", "*.IPYNB" },
	command = "set ft=ipynb",
})

-- Magma stuff
function MoltenInitPython()
	vim.cmd([[
  :MoltenInit python3
  :MoltenEvaluateArgument a=5
  ]])
end

function JupInit()
	local time = os.time(os.date("!*t"))
	local jup_file = "/tmp/" .. time .. "_jup.json"
	-- vim.cmd(':!python -m ipykernel_launcher -f /tmp/' .. time .. '-jup.json &')
	-- io.popen('python3 -m ipykernel_launcher -f ' .. jup_file .. ' &')
	local Job = require("plenary.job")

	Job:new({
		command = "python3",
		args = { "-m", "ipykernel_launcher", "-f", jup_file },
		-- cwd = "/home/guillaume/venv/valgo2/bin",
		-- env = { ['a'] = 'b' },
		on_exit = function(j, return_val)
			print(return_val)
			print(j:result())
		end,
	}):start() -- or start()
	return jup_file
end

function JupAttach(jup_file)
	vim.cmd(":MoltenInit " .. jup_file)
	vim.cmd(":JupyterAttach " .. jup_file)
end

function file_exists(name)
	-- check if file exists on disk
	local f = io.open(name, "r")
	return f ~= nil and io.close(f)
end

function sleep(n)
	-- simple function to sleep
	os.execute("sleep " .. tonumber(n))
end

function wait_for_file(name)
	-- wait until file exists for maximum of 5 sec
	exists = file_exists(name)
	i = 0
	while not exists and i < 10 do
		sleep(0.5)
		exists = file_exists(name)
		i = i + 1
	end
	return exists
end

function JupRun()
	-- launche jupyter kernel
	local jup_file = JupInit()
	-- wait for the json file to be available
	exists = wait_for_file(jup_file)
	-- attach magma.nvim and jupyter.nvim to the kernel
	if exists then
		JupAttach(jup_file)
	else
		print("Jupyter kernel not started")
	end
end

function JupDefault()
	vim.cmd([[
  :JupyterAttach /tmp/j.json
  :MagmaInit /tmp/j.json
  ]])
end

-- :command MagmaInitPython lua MagmaInitPython()
-- :command JupDefault lua JupDefault()
-- :command JupAttach -nargs=1 lua JupAttach(<q-args>)
vim.cmd([[
:command JupRun lua JupRun()
]])
