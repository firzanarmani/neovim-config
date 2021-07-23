local utils = require('utils')

utils.o.guicursor = ''
utils.wo.relativenumber = true
utils.wo.number = true
utils.o.hlsearch = false
utils.o.hidden = true
utils.o.errorbells = false
utils.o.shiftwidth = 4
utils.bo.expandtab = true
utils.bo.smartindent = true
utils.wo.wrap = false
utils.bo.swapfile = false
utils.o.backup = false

-- UNDO STUFF HERE --
utils.o.undodir = utils.fn.stdpath('config') .. '/undodir'
utils.o.undofile = true

utils.o.incsearch = true
utils.o.scrolloff = 8
utils.wo.colorcolumn = '80'
utils.wo.signcolumn = 'yes'
utils.bo.tabstop = 2
utils.bo.softtabstop = 2

utils.o.completeopt = 'menuone,noinsert,noselect'
