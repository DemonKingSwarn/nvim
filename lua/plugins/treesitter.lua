vim.pack.add({"https://github.com/nvim-treesitter/nvim-treesitter"})
local config = require("nvim-treesitter.configs")
config.setup({
  auto_install = true,
  -- ensure_installed = { "lua", "python", "html", "c", "vim", "javascript", "gdscript", "c_sharp" },
  highlight = { enable = true },
  indent = { enable = true },
})
