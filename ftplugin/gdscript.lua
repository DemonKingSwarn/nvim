local port = '6005'
local cmd
if vim.fn.executable("ncat") == 1 then
  cmd = { 'ncat', '127.0.0.1', port }
elseif vim.fn.executable("nc") == 1 then
  cmd = { "nc", "127.0.0.1", port }
end

local pipe = '/tmp/godot.pipe'

vim.lsp.start({
  name = 'Godot',
  cmd = cmd,
  root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
  on_attach = function(client, bufnr)
    vim.fn.serverstart(pipe)
  end
})
