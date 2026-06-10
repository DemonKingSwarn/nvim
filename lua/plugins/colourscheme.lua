vim.pack.add({"https://github.com/serhez/teide.nvim"})
--vim.pack.add({"https://github.com/gbprod/nord.nvim"})
--vim.pack.add({"https://github.com/uZer/pywal16.nvim"})

--vim.pack.add({"https://github.com/nyoom-engineering/oxocarbon.nvim"})

local function ColorMyPencils()
  vim.cmd([[colorscheme teide]])
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
