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

-- setup tabs and indenting
vim.opt.expandtab = true
vim.opt.smartindent = true
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

-- matching bracket settings
vim.opt.showmatch = true
vim.opt.matchtime = 2

-- commandline settings
vim.opt.cmdheight = 1
vim.opt.showmode = false

-- popup settings
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0

-- concealing settings
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""

-- redraw lazilly
vim.opt.lazyredraw = true

-- lower syntax highlighing for performance
vim.opt.synmaxcol = 300

-- better completion options
vim.opt.completeopt = "menuone,noinsert,noselect"

-- enable signcolumn
vim.opt.signcolumn = "yes"

-- enable rounded borders
vim.opt.winborder = "rounded"

-- better file handling
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.local/state/nvim/undo")
vim.opt.autoread = true
vim.opt.autowrite = true

-- durations for completion and other stuff
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0

-- change some behaviour settings
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.backspace = "indent,eol,start"
vim.opt.autochdir = false
vim.opt.iskeyword:append("-") -- treat dash as part of the word
vim.opt.path:append("**") -- include subdirectories in search
vim.opt.selection = "exclusive"
vim.opt.modifiable = true
vim.opt.encoding = "UTF8"
