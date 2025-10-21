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
  -- setup autocompletion
  -- on_attach = function(client, bufnr)
  --   vim.lsp.completion.enable(true, client.id, bufnr, {
  --     autotrigger = true,
  --     convert = function(item)
  --       return { abbr = item.label:gsub('%b()', '') }
  --     end,
  --   })
  -- end,
})

-- enable specific language servers
vim.lsp.enable({
  "nixd",
  "lua_ls",
  "jsonls",
})

-- diagnostic settings
vim.diagnostic.config({ virtual_text = true })
