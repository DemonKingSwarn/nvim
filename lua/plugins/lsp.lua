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
  "lua_ls",
  "marksman",
  "gopls",
  "ruff",
  "rust-analyzer",
  "basedpyright",
  "clangd",
  "bash-language-server",
  "csharp_ls",
  "zls",
  "vscode-html-language-server",
  "vscode-css-language-server",
  "vscode-json-language-server",
  "vscode-eslint-language-server",
})

-- diagnostic settings
vim.diagnostic.config({ virtual_text = true })

-- fix annoying lua lsp errors
require("lazydev").setup()
