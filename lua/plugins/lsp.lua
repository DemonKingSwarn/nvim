vim.pack.add({
  { src = "https://github.com/folke/lazydev.nvim" }
})

vim.lsp.config("*", {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      }
    }
  },
  root_markers = { '.git' },
})

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

vim.diagnostic.config({ virtual_text = true })

require("lazydev").setup()
