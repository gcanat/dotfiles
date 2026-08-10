---@type vim.lsp.Config
return {
    cmd = { "ruff", "server", "--preview" },
    root_markers = {"pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git"},
    filetypes = {"python"},
    init_options = {
        hostInfo = "neovim",
    },
}
