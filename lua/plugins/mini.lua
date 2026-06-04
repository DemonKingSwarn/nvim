vim.pack.add({ { src = "https://github.com/nvim-mini/mini.nvim" } })

-- setup statusline
require('mini.statusline').setup({
  use_icons = true,
})

--local c = require("pywal16.core")  -- exposes the color table
--vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal",  { fg = c.background, bg = c.color1,  bold = true })
--vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert",  { fg = c.background, bg = c.color2,  bold = true })
--vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual",  { fg = c.background, bg = c.color5,  bold = true })
--vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { fg = c.background, bg = c.color3,  bold = true })
--vim.api.nvim_set_hl(0, "MiniStatuslineModeOther",   { fg = c.background, bg = c.color6,  bold = true })
--vim.api.nvim_set_hl(0, "MiniStatuslineFilename",    { fg = c.foreground, bg = c.color8  })
--vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo",    { fg = c.foreground, bg = c.color8  })

-- colorscheme integration
--require("teide").setup({
--  integration = {
--    mini = true,
--  },
--})

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
