-- enable line number and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- make splits open on bottom and right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- disable line wrapping
vim.opt.wrap = false

-- setup tabs nicelly
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- setup a nice scrolloff value
vim.opt.scrolloff = 20

-- make virtual edit work for blocks
vim.opt.virtualedit = "block"

-- make :s and others open a split
vim.opt.inccommand = "split"

-- ignore case
vim.opt.ignorecase = true

-- setup leader and local leader
vim.g.mapleader = " "
vim.g.maplocalleader = ";"
