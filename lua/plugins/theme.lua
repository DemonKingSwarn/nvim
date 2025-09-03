return {
  "everviolet/nvim",
  --"rose-pine/neovim",
  -- "catppuccin/nvim",
  --"sainnhe/sonokai",
  --"neanias/everforest-nvim",
	name = "evergarden",
  priority = 1000,
	config = function()
		function ColorMyPencils(color)
			color = "evergarden"
			vim.cmd.colorscheme(color)
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end

		ColorMyPencils()
	end,
}
