-- vim.opt.termguicolors = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.clipboard = 'unnamedplus'

-- naviagate panes with Shift + h/j/k/l instead of ctrl + w -> h/j/k/l
vim.keymap.set('n', '<S-H>', '<C-w>h')
vim.keymap.set('n', '<S-L>', '<C-w>l')
vim.keymap.set('n', '<S-J>', '<C-w>j')
vim.keymap.set('n', '<S-K>', '<C-w>k')

-- html.slim syntax highlighting
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*.slim' },
  command = 'set ft=slim',
})
