vim.pack.add({
  { src = "https://github.com/folke/lazydev.nvim" }
})

-- Enable some settings globally
vim.lsp.config("*", {
  -- allow for multiline token support
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      }
    }
  },
  -- make .git always be a root marker
  root_markers = { '.git' },
})

-- enable specific language servers
vim.lsp.enable({
  "nixd",
  "lua_ls",
  "jsonls",
  "html",
  "marksman",
  "gopls",
  "ruff",
  "basedpyright",
  "yamlls",
  "bashls",
  "csharp_ls",
  "zls",
})

-- diagnostic settings
vim.diagnostic.config({ virtual_text = true })

-- fix annoying lua lsp errors
require("lazydev").setup()
