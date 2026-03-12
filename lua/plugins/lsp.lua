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

-- fix annoying lua lsp errors
require("lazydev").setup()

-- enable specific language servers
vim.lsp.enable({
  "csharp_ls",
  "lua_ls",
  "jsonls",
  "rust_analyzer",
  "marksman",
  "gopls",
  "ruff",
  "basedpyright",
  "yamlls",
  "bashls",
  "just",
  "clangd",
})

-- diagnostic settings
vim.diagnostic.config({ virtual_text = true })

