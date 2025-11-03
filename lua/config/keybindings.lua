-- setup leader and local leader
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- source current file
vim.keymap.set("n", "<Leader> ", ":update<CR> :source<CR>", { desc = "Source current lua file" })

-- -- format
-- vim.keymap.set("n", "<Leader>lf", vim.lsp.buf.format, { desc = "Format buffer with available lsp" })

-- easy copy/cut/paste from system clipboard
vim.keymap.set({ "n", "v", "x" }, "<Leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v", "x" }, "<Leader>d", '"+d', { desc = "Cut to system clipboard" })
vim.keymap.set({ "n", "v", "x" }, "<Leader>p", '"+p', { desc = "Paste from system clipboard" })

-- better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- file exploring

-- Copy Full File-Path
vim.keymap.set("n", "<leader>yp", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("file:", path)
end)
