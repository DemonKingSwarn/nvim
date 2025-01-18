return {
	--"rose-pine/neovim",
  "folke/tokyonight.nvim",
	name = "tokyonight",
	config = function()
		function ColorMyPencils(color)
			color = "tokyonight"
			vim.cmd.colorscheme(color)
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end

		ColorMyPencils()
	end,
}
