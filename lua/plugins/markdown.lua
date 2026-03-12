vim.pack.add({
  { 
    src = "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    on_add = function()
      require("render-markdown").setup({
        completions = { lsp = { enabled = true } },
      })
    end
  },
  { 
    src = "https://github.com/tadmccorkle/markdown.nvim",
    on_add = function()
      require("markdown").setup()
    end
  },
  { 
    src = "https://github.com/Kicamon/markdown-table-mode.nvim",
    on_add = function()
      require("markdown-table-mode").setup()
    end
  },
})
