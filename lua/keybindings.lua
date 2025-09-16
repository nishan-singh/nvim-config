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

-- Set <C-a> to move to beginning of line and set <C-b> to one character back
vim.keymap.set('c', '<C-a>', '<Home>', { noremap = true })
vim.keymap.set('c', '<C-b>', '<Left>', { noremap = true })

-- <leader>od -> pick a directory with fzf-lua, open it in oil
vim.keymap.set("n", "<leader>od", function()
  require("fzf-lua").fzf_exec("fd -td", { -- list only dirs (requires fd)
    prompt = "Dirs> ",
    actions = {
      -- run when you hit <CR>
      ["default"] = function(selected)
        local dir = selected and selected[1]
        if not dir or dir == "" then return end
        -- make absolute (netrw/oil like absolute; optional)
        dir = vim.fn.fnamemodify(dir, ":p")
        require("oil").open(dir)
      end,
    },
  })
end)

