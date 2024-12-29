return {
  'jbyuki/nabla.nvim',
  config = function()
    vim.keymap.set("n", "<leader>p", ":lua require('nabla').popup()<CR>")
  end,
}
