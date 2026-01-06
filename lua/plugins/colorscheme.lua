-- vim.pack.add({"https://github.com/catppuccin/nvim.git"})
-- vim.pack.add({"https://github.com/folke/tokyonight.nvim"})
vim.pack.add({"https://github.com/serhez/teide.nvim"})

function ColorMyPencils()
  vim.cmd([[colorscheme teide-darker]])
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
