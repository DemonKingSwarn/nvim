require'lspconfig'.ols.setup {
	init_options = {
		checker_args = "-strict-style",
		collections = {
			{ name = "shared", path = vim.fn.expand('/usr/lib/odin/') }
		},
	},
}
