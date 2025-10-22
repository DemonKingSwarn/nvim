vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.nvim" },
})

-- setup picker with icons
require("mini.icons").setup()
require("mini.pick").setup({
  options = {
    use_cache = true,
  },
})

-- additional mini.pick pickers
require("mini.extra").setup()

-- amazing highlight plugin, also used with mini.pick
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

-- mini.pick keybindings
local patterns = { "fixme", "hack", "todo", "note", }
vim.keymap.set("n", "<Leader>ff", ":Pick files<CR>", { desc = "Search file in directory" })
vim.keymap.set("n", "<Leader>fh", ":Pick help<CR>", { desc = "Search neovim help" })
vim.keymap.set("n", "<Leader>fd", ":Pick diagnostic<CR>", { desc = "Search diagnostics" })
vim.keymap.set("n", "<Leader>fgb", ":Pick git_branches scope='local'<CR>", { desc = "Search git branches" })
vim.keymap.set("n", "<Leader>fgc", ":Pick git_commits<CR>", { desc = "Search git commits" })
vim.keymap.set("n", "<Leader>fgh", ":Pick git_hunks<CR>", { desc = "Search git hunks" })
vim.keymap.set("n", "<Leader>fp", function()
  MiniExtra.pickers.hipatterns({ highlighters = patterns })
end, { desc = "Search git hunks" })

-- git related stuff
require("mini.git").setup()
require("mini.diff").setup()

-- setup statusline
require("mini.statusline").setup()

-- setup snippets
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

-- setup completion
require("mini.completion").setup()

-- move lines
require("mini.move").setup()

-- easy split args
require("mini.splitjoin").setup()

-- surround actions
require("mini.surround").setup()

-- super simple but amazing file manager
require("mini.files").setup()

-- setup simple function for toggling mini.files
local minifiles_toggle = function(...)
  if not MiniFiles.close() then MiniFiles.open(...) end
end

-- Set focused directory as current working directory
local set_cwd = function()
  local path = (MiniFiles.get_fs_entry() or {}).path
  if path == nil then return vim.notify('Cursor is not on valid entry') end
  vim.fn.chdir(vim.fs.dirname(path))
end

-- Yank in register full path of entry under cursor
local yank_path = function()
  local path = (MiniFiles.get_fs_entry() or {}).path
  if path == nil then return vim.notify('Cursor is not on valid entry') end
  vim.fn.setreg(vim.v.register, path)
end

-- Open path with system default handler (useful for non-text files)
local ui_open = function() vim.ui.open(MiniFiles.get_fs_entry().path) end

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local b = args.data.buf_id
    vim.keymap.set('n', 'g~', set_cwd, { buffer = b, desc = 'Set cwd' })
    vim.keymap.set('n', 'gX', ui_open, { buffer = b, desc = 'OS open' })
    vim.keymap.set('n', 'gy', yank_path, { buffer = b, desc = 'Yank path' })
  end,
})

-- setup keybinding for mini.files
vim.keymap.set("n", "<Leader>e", function() minifiles_toggle() end, { desc = "Toggle mini.files explorer" })

-- setup mini.clues, whickey but much simpler
local miniclue = require('mini.clue')
miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },

    -- add in support for built in completion
    { mode = 'i', keys = '<C-x>' },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
    -- add some clues to custom stuff
    { mode = "n", keys = "<Leader>f",  desc = "Find" },
    { mode = "n", keys = "<Leader>fg", desc = "Git" },
    { mode = "n", keys = "<Leader>l",  desc = "Lsp" },
    { mode = "n", keys = "<Leader>s",  desc = "Treesitter" },
    { mode = "n", keys = "<Leader>v",  desc = "Visits" },

    -- built in completion
    { mode = 'i', keys = '<C-x><C-f>', desc = 'File names' },
    { mode = 'i', keys = '<C-x><C-l>', desc = 'Whole lines' },
    { mode = 'i', keys = '<C-x><C-o>', desc = 'Omni completion' },
    { mode = 'i', keys = '<C-x><C-s>', desc = 'Spelling suggestions' },
    { mode = 'i', keys = '<C-x><C-u>', desc = "With 'completefunc'" },
  },
})

-- minimal session manager
require("mini.sessions").setup()

vim.keymap.set("n", "<Leader>pc", function() MiniSessions.write() end, { desc = "Create new session/project" })
vim.keymap.set("n", "<Leader>ps", function() MiniSessions.select("read") end, { desc = "Select session/project" })

-- nice file/directory visit tracker
require("mini.visits").setup()

-- setup some basic label keybindings
local map_vis = function(keys, call, desc)
  local rhs = '<Cmd>lua MiniVisits.' .. call .. '<CR>'
  vim.keymap.set('n', '<Leader>' .. keys, rhs, { desc = desc })
end

map_vis('vv', 'add_label()', 'Add label')
map_vis('vV', 'remove_label()', 'Remove label')
map_vis('vc', 'add_label("core")', 'Add to core')
map_vis('vC', 'remove_label("core")', 'Remove from core')
vim.keymap.set("n", "<Leader>fv", ":Pick visit_paths<CR>", { desc = "Search visited files" })
vim.keymap.set("n", "<Leader>fc", ":Pick visit_paths filter='core'<CR>",
  { desc = "Search visited files with tag 'core'" })

-- amazing fast indent scope highlight plugin
require("mini.indentscope").setup()

-- nice simple notifications inside neovim
require("mini.notify").setup()

-- simple startup startup screen
local starter = require('mini.starter')
starter.setup({
  evaluate_single = true,
  items = {
    starter.sections.builtin_actions(),
    starter.sections.sessions(5, true),
    starter.sections.recent_files(5, true),
    starter.sections.recent_files(5, false),
  },
  content_hooks = {
    starter.gen_hook.adding_bullet(),
    starter.gen_hook.aligning("center", "center")
  },
})
