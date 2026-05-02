-- simple startup screen
local starter = require('mini.starter')
starter.setup({
  header = "hello, friend",
  footer = "you're gay for my code, you're code gay.",
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
