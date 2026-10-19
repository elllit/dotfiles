
-- reload config
vim.keymap.set('n', '<leader>u', ':update<CR> :source<CR>')

-- sorting lines marked in visual mode
vim.keymap.set('x', '<leader>aa', ':sort<CR>', { desc='Sort buffer ascending' })
vim.keymap.set('x', '<leader>ad', ':sort!<CR>', { desc='Sort buffer descending' })

-- open file under cursor in vertical split
-- use gx to open in new window
vim.keymap.set('n', '<leader>of', '<CMD>vertical wincmd f<CR>', { desc='Open file in vsplit' })
vim.keymap.set('n', '<leader>oF', '<CMD>vertical wincmd F<CR>', { desc='Open file in vsplit at line' })
