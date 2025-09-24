-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>cl", "<cmd>checkhealth lsp<CR>")

-- Disable Backspace in insert + command-line modes
vim.keymap.set({ "i", "c" }, "<BS>", "<Nop>", { noremap = true, silent = true })

vim.keymap.set("i", "<C-\\>d", "<Del>", { noremap = true, silent = true })

-- Set <C-a> to move to beginning of line and set <C-b> to one character back
vim.keymap.set('c', '<C-a>', '<Home>', { noremap = true })
vim.keymap.set('c', '<C-b>', '<Left>', { noremap = true })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

---------------------------------- Plugin based keybindings ----------------------------------
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

---------------------------------- Other keybindings ----------------------------------
-- toogle virtual text
vim.keymap.set("n", "<leader>vt", function()
  vim.diagnostic.config { virtual_text = not vim.diagnostic.config().virtual_text }
end, { desc = "Toggle virtual text for diagnostics" })

-- search neovim config files
vim.keymap.set("n", "<leader>sn", function()
  require("fzf-lua").files { cwd = vim.fn.stdpath "config" }
end, { desc = "[S]earch [N]eovim files" })
