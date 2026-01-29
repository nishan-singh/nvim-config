-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("i", "<C-\\>d", "<Del>", { noremap = true })

vim.keymap.set("n", "-", ":Ex<CR>", { noremap = true })

vim.keymap.set('c', '<C-a>', '<Home>', { noremap = true })
vim.keymap.set('c', '<C-b>', '<Left>', { noremap = true })

-- Defined in lua/custom-functions.lua
vim.keymap.set("n", "<leader>b", ":GitBlameShort<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>f", ":find ", { noremap = true })
vim.keymap.set("n", "<leader>g", ":grep ", { noremap = true })

vim.keymap.set("n", "gs", "^", {noremap = true})
vim.keymap.set("n", "gl", "$", {noremap = true})

---------------------------------- Plugin based keybindings ----------------------------------

vim.keymap.set('n', '<leader>f', function()
  require('fff').find_files()
end, { desc = '[F]ind [F]iles with fff.nvim' })

