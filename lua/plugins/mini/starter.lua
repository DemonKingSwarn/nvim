-- simple startup screen
local starter = require('mini.starter')
starter.setup({
  header = "hello, friend",
  footer = "it's the thing which gets us to the thing.",
  evaluate_single = true,
  items = {
    starter.sections.builtin_actions(),
    starter.sections.recent_files(5, true),
    starter.sections.recent_files(5, false),
  },
  content_hooks = {
    starter.gen_hook.adding_bullet(),
    starter.gen_hook.aligning("center", "center"),
  },
})
