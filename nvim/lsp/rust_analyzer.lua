---@type vim.lsp.Config
return {
    cmd = { "rust-analyzer" },
    root_markers = { "Cargo.toml", ".git"},
    filetypes = {"rust"},
}
