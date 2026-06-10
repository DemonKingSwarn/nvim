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

-- simple startup startup screen
local starter = require('mini.starter')
starter.setup({
  header = "Hello, Friend",
  footer = "It's the thing that gets us to the thing",
  evaluate_single = true,
  items = {
    starter.sections.builtin_actions(),
    starter.sections.recent_files(5, true),
    starter.sections.recent_files(5, false),
  },
  content_hooks = {
    starter.gen_hook.adding_bullet(),
    starter.gen_hook.aligning("center", "center")
  },
})
