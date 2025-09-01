return {
	--"rebelot/kanagawa.nvim",
  "rose-pine/neovim",
  -- "catppuccin/nvim",
	name = "rose-pine",
  priority = 1000,
	config = function()
		function ColorMyPencils(color)
			color = "rose-pine"
			vim.cmd.colorscheme(color)
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end

		ColorMyPencils()
	end,
}
