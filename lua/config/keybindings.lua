-- setup leader and local leader
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- source current file
vim.keymap.set("n", "<Leader> ", ":update<CR> :source<CR>", { desc = "Source current lua file" })

-- format
vim.keymap.set("n", "<Leader>lf", vim.lsp.buf.format, { desc = "Format buffer with available lsp" })

-- setup mini.pick
vim.keymap.set("n", "<Leader>ff", ":Pick files<CR>", { desc = "Search file in directory" })
vim.keymap.set("n", "<Leader>fh", ":Pick help<CR>", { desc = "Searcch neovim help" })

-- move lines up or down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- file exploring
vim.keymap.set("n", "<Leader>e", ":Oil<CR>", { desc = "Open oil file explorer" })

-- Copy Full File-Path
vim.keymap.set("n", "<leader>yp", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end)
