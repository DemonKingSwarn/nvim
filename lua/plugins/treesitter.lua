return { 
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "python", "html", "c", "vim", "javascript", "gdscript", "c_sharp" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
