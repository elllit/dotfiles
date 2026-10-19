vim.o.number = true

vim.o.relativenumber = true

-- using google cpp style guide indentation rules
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.signcolumn = "yes"

vim.o.undofile = true
vim.o.autoread = true
vim.o.laststatus = 3

-- borders around windows. 
-- for instance around diagnostics or docs
vim.o.winborder = 'rounded'

-- add recursive search so that 'path' finds files
-- this is essential for <leader>of to find the file
vim.opt.path:append("**")
