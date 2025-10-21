vim.lsp.enable({
  "nixd",
  "lua_ls",
})

-- fix stupid lua error with neovim
require("lazydev").setup()
