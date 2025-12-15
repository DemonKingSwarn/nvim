vim.pack.add({"https://github.com/catppuccin/nvim.git"})

function ColorMyPencils()
  vim.cmd([[colorscheme catppuccin]])
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
