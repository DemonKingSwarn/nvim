---@diagnostic disable: missing-fields
require("nvim-treesitter.configs").setup({
  ensure_installed = { "go", "nix" },

  auto_install = true,

  highlight = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<Leader>ss",
      node_incremental = "<Leader>si",
      scope_incremental = "<Leader>sc",
      node_decremental = "<Leader>sd",
    },
  },
})
