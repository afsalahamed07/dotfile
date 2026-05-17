local function set_cursor_mode_highlights()
  vim.api.nvim_set_hl(0, "CursorNormal", { fg = "#1c1c1c", bg = "#dadada" })
  vim.api.nvim_set_hl(0, "CursorVisual", { fg = "#1c1c1c", bg = "#87afaf" })
  vim.api.nvim_set_hl(0, "CursorInsert", { fg = "#1c1c1c", bg = "#5fafd7" })
  vim.api.nvim_set_hl(0, "CursorReplace", { fg = "#1c1c1c", bg = "#d75f87" })
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
