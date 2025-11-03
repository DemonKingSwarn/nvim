vim.pack.add({
  { src = "https://github.com/tadmccorkle/markdown.nvim" },
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
  { src = "https://github.com/Kicamon/markdown-table-mode.nvim" },
})

require("render-markdown").setup({
  completions = { lsp = { enabled = true, } },
})

require("markdown").setup()

require("markdown-table-mode").setup()
