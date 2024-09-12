return {
	"vimwiki/vimwiki",
	config = function()
		vim.g.vimwiki_list = { {
			path = "~/.local/share/vimwiki",
			syntax = "markdown",
			ext = "wiki",
		} }
	end,
}
