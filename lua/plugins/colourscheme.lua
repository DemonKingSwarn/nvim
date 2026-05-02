vim.pack.add({"https://github.com/serhez/teide.nvim"})

local function ColorMyPencils()
  vim.cmd([[colorscheme teide-darker]])
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
