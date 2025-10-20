return {
  {
    "neovim/nvim-lspconfig",
    config = function()

      vim.lsp.enable("nixd")
    end,
  },
}
