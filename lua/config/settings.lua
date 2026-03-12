vim.g.mapleader = " "

-- navigate vim panes better
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')

-- enable line number and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- highlight cursorline
vim.opt.cursorline = true

-- highlight column 80
vim.opt.colorcolumn = "80"

-- make splits open on bottom and right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- disable line wrapping
vim.opt.wrap = false

-- enable global statusline
vim.opt.laststatus = 3

-- setup tabs and indenting
vim.opt.expandtab = true
vim.opt.smartindent = false
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- setup a nice scrolloff value
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 10

-- make virtual edit work for blocks
vim.opt.virtualedit = "block"

-- make :s and others open a split
vim.opt.inccommand = "split"

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- commandline settings
vim.opt.cmdheight = 1
vim.opt.showmode = false

-- popup settings
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0

-- better completion options
vim.opt.completeopt = "menuone,noinsert,noselect"

-- enable signcolumn
vim.opt.signcolumn = "yes"

-- enable rounded borders (nvim 0.11+)
vim.opt.winborder = "rounded"

-- better file handling
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.local/state/nvim/undo")
vim.opt.autoread = true
vim.opt.autowrite = false
vim.opt.clipboard = 'unnamedplus'

-- durations for completion and other stuff
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0

-- change some behaviour settings
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.backspace = "indent,eol,start"
vim.opt.iskeyword:append("-") -- treat dash as part of the word
vim.opt.path:append("**")     -- include subdirectories in search
vim.opt.modifiable = true
vim.opt.encoding = "UTF8"

-- better completion settings for the commandline
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- disable builtin plugins that I don't use
local builtin_plugs = {
  "gzip",
  "matchit",
  "matchparen",
  "netrwPlugin",
  "tarPlugin",
  "tohtml",
  "tutor",
  "zipPlugin",
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
}

for i = 1, #builtin_plugs do
  vim.g['loaded_' .. builtin_plugs[i]] = true
end
