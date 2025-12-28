-- vim.pack.add({"https://github.com/catppuccin/nvim.git"})
vim.pack.add({"https://github.com/folke/tokyonight.nvim"})

function ColorMyPencils()
  vim.cmd([[colorscheme tokyonight-moon]])
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
