vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


vim.opt.number = true
vim.opt.undofile = true
vim.opt.mouse = 'a'

vim.opt.tabstop = 4 -- A TAB character looks like 4 spaces
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 4 -- Number of spaces inserted when indenting


require('config.lazy')
