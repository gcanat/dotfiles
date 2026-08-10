---@type vim.lsp.Config
return {
	cmd = { "jedi-language-server"},
	root_markers = {"pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git"},
	filetypes = {"python"},
	init_options = {
		hostInfo = "neovim",
	},
	on_exit = function(code, _, _)
		vim.notify('Closing jedi-ls LSP exited with code: ' .. code, vim.log.levels.INFO)
	end,
}
