vim.g.mapleader = " "
vim.opt.termguicolors = true

vim.opt.guicursor = {
  "n-c:blinkon1-block-CursorNormal", -- Normal, Visual, and Command modes
  "v:block-CursorVisual",
  "i:block-CursorInsert", -- Insert mode
  "r-cr:block-CursorReplace", -- Replace and Command-line Replace modes
}

vim.g.have_nerd_font = true
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 10
vim.opt.backupcopy = "yes"
vim.opt.spelllang = "en_us"
vim.opt.spell = true
vim.opt.showtabline = 0
