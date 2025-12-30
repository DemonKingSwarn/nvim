local function command_exists(cmd)
  local handle = io.popen("which " .. cmd .. " 2>/dev/null")
  local result = handle:read("*a")
  handle:close()
  return result ~= ""
end

local port = '6005'
local cmd
if command_exists("ncat") then
  cmd = {'ncat', '127.0.0.1', port}
elseif command_exists("nc") then
  cmd = {"nc", "127.0.0.1", port}
end
local pipe = '/tmp/godot.pipe'

vim.lsp.start({
  name = 'Godot',
  cmd = cmd,
  root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true})[1]),
  on_attach = function(client, bufnr)
    vim.api.nvim_command('echo serverstart("' .. pipe ..'")')
  end
})
