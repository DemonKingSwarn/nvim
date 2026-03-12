vim.pack.add({ { src = "https://github.com/nvim-mini/mini.nvim" } })

-- setup statusline
require('mini.statusline').setup({
  use_icons = true,
})

-- colorscheme integration
require("teide").setup({
  integration = {
    mini = true,
  },
})

-- amazing fast indent scope highlight plugin
require('mini.indentscope').setup({
  draw = {
    delay = 100,
    predicate = function(scope) return not scope.body.is_incomplete end,
    priority = 2,
  }
})

-- git related stuff
require('mini.git').setup()
require('mini.diff').setup()

-- load mini sub-modules
require("plugins.mini.init")
