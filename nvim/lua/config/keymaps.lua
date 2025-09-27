-- source actions
vim.keymap.set("n", "<C-x>", "<cmd>source % <CR>", { desc = "Source the lua file" })
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "Source the current line" })
vim.keymap.set("v", "<space>x", ":lua<CR>", { desc = "Source the selected line" })

vim.keymap.set("n", "<S-h>", "^")
vim.keymap.set("n", "<S-l>", "$")
vim.keymap.set("v", "<S-h>", "^")
vim.keymap.set("v", "<S-l>", "$")
vim.keymap.set("n", "vv", "<C-v>")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")

--  quick fix list navigation
vim.api.nvim_set_keymap("n", "<C-j>", ":cnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":cprev<CR>", { noremap = true, silent = true })
