vim.g.mapleader = " "
vim.opt.termguicolors = true

vim.opt.guicursor = {
  "n-c:blinkon1-block-CursorNormal", -- Normal, Visual, and Command modes
  "v:block-CursorVisual",
  "i:block-CursorInsert", -- Insert mode
  "r-cr:block-CursorReplace", -- Replace and Command-line Replace modes
}

-- Highlight group for Insert mode cursor
vim.api.nvim_set_hl(0, "CursorNormal", { fg = "#1e1e2e", bg = "#ea9d34" })
vim.api.nvim_set_hl(0, "CursorVisual", { fg = "#1e1e2e", bg = "#c4a7e7" })
vim.api.nvim_set_hl(0, "CursorInsert", { fg = "#1e1e2e", bg = "#3e8fb0" })
vim.api.nvim_set_hl(0, "CursorReplace", { fg = "#1e1e2e", bg = "#eb6f92" })

vim.g.have_nerd_font = true
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 10
vim.opt.backupcopy = "yes"
vim.opt.spelllang = "en_us"
vim.opt.spell = true
vim.opt.showtabline = 0
