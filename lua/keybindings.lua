-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<leader>pv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>ph", "<C-w>s", { desc = "Split window horizontally" })

-- toogle virtual text
vim.keymap.set("n", "<leader>vt", function()
  vim.diagnostic.config { virtual_text = not vim.diagnostic.config().virtual_text }
end, { desc = "Toggle virtual text for diagnostics" })

vim.keymap.set("n", "<leader>sn", function()
  require("fzf-lua").files { cwd = vim.fn.stdpath "config" }
end, { desc = "[S]earch [N]eovim files" })

vim.keymap.set("n", "<leader>cl", "<cmd>checkhealth lsp<CR>")

-- Disable Backspace in insert + command-line modes
vim.keymap.set({ "i", "c" }, "<BS>", "<Nop>", { noremap = true, silent = true })
