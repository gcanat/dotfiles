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
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.nfo", "*.NFO"},
  command = "set ft=nfo"
})
