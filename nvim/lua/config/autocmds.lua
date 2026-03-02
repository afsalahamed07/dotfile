local function set_cursor_mode_highlights()
  vim.api.nvim_set_hl(0, "CursorNormal", { fg = "#1e1e2e", bg = "#ea9d34" })
  vim.api.nvim_set_hl(0, "CursorVisual", { fg = "#1e1e2e", bg = "#c4a7e7" })
  vim.api.nvim_set_hl(0, "CursorInsert", { fg = "#1e1e2e", bg = "#3e8fb0" })
  vim.api.nvim_set_hl(0, "CursorReplace", { fg = "#1e1e2e", bg = "#eb6f92" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
    set_cursor_mode_highlights()
  end,
})

set_cursor_mode_highlights()
