vim.pack.add({"https://github.com/nvim-mini/mini.nvim"})

require('mini.statusline').setup({
  use_icons = true,
})

require("tokyonight").setup({
  integration = {
    mini = true,
  },
})

require('mini.starter').setup({
  header = "hello, friend",
  footer = "you're gay for my code, you're code gay."
})

require('mini.icons').setup({
  style = 'glyph',
  use_file_extension = function(ext, file) return true end,
})


require("mini.pick").setup({
  options = {
    use_cache = true,
  },
})

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
  highlighters = {
    fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
    todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

require('mini.indentscope').setup({
  draw = {
    delay = 100,
    predicate = function(scope) return not scope.body.is_incomplete end,
    priority = 2,
  }
})
      
require('mini.git').setup()      
require('mini.diff').setup()
require('mini.completion').setup()
require("mini.extra").setup()

local gen_loader = require("mini.snippets").gen_loader
require("mini.snippets").setup({
  snippets = {
    gen_loader.from_lang(),
  },
  mappings = {
    jump_next = "<C-j>",
    jump_prev = "<C-k>",
  },
})

-- mini.pick keybindings
local patterns = { "fixme", "hack", "todo", "note", }
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

-- super simple but amazing file manager
require("mini.files").setup()

-- setup simple function for toggling mini.files
local minifiles_toggle = function(...)
  if not MiniFiles.close() then MiniFiles.open(...) end
end

vim.keymap.set('n', '<leader>e', minifiles_toggle, { desc = 'Toggle mini.files' })
