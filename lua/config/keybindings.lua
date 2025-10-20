-- setup leader and local leader
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- source current file
vim.keymap.set("n", "<Leader> ", ":update<CR> :source<CR>")
