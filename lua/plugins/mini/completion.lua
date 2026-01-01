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
