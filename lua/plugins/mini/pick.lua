-- setup picker with icons
require("mini.icons").setup({
  style = 'glyph',
  use_file_extension = function(ext, file) return true end,
})
require("mini.pick").setup({
  options = {
    use_cache = true,
  },
})

-- additional mini.pick pickers
require("mini.extra").setup()

-- mini.pick keybindings
local patterns = { "fixme", "hack", "todo", "note" }
vim.keymap.set("n", "<Leader>ff", ":Pick files<CR>", { desc = "Search file in directory" })
vim.keymap.set("n", "<Leader>fw", ":Pick grep_live<CR>", { desc = "Search for word in directory" })
vim.keymap.set("n", "<Leader>fh", ":Pick help<CR>", { desc = "Search neovim help" })
vim.keymap.set("n", "<Leader>fd", ":Pick diagnostic<CR>", { desc = "Search diagnostics" })
vim.keymap.set("n", "<Leader>fgb", ":Pick git_branches scope='local'<CR>", { desc = "Search git branches" })
vim.keymap.set("n", "<Leader>fgc", ":Pick git_commits<CR>", { desc = "Search git commits" })
vim.keymap.set("n", "<Leader>fgh", ":Pick git_hunks<CR>", { desc = "Search git hunks" })
vim.keymap.set("n", "<Leader>fp", function()
  MiniExtra.pickers.hipatterns({ highlighters = patterns })
end, { desc = "Search patterns" })
