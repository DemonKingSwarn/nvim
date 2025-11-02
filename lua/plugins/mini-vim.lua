return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      function ColorMyPencils(color)
        color = "catppuccin"
        vim.cmd.colorscheme(color)
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      end

      ColorMyPencils()
    end,
  },
  {
    'nvim-mini/mini.nvim',
    version = false,
    config = function()
      require('mini.statusline').setup({
        use_icons = true,
      })
      require("catppuccin").setup({
        integration = {
          mini = true,
        },
      })
      require('mini.starter').setup({
        header = "Hello, Friend",
        footer = "We stand on the shoulders of the giants!"
      })
      require('mini.icons').setup({
        style = 'glyph',
        use_file_extension = function(ext, file) return true end,
      })
      require('mini.indentscope').setup({
        draw = {
          delay = 100,
          predicate = function(scope) return not scope.body.is_incomplete end,
          priority = 2,
        }
      })
    end,
  }
}
