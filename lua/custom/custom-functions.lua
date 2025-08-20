vim.api.nvim_create_user_command("GitBlameShort", function()
  local current_line = vim.fn.line "."
  local file = vim.fn.expand "%:p" -- full path for safety
  local output = vim.fn.systemlist { "git", "blame", "-L", current_line .. ",+1", "--line-porcelain", file }

  local author, timestamp, summary
  for _, line in ipairs(output) do
    -- match with `author-time` or `commit-time`
    if line:match "^author%-time " then
      local ts = tonumber(line:sub(13))
      timestamp = os.date("%Y-%m-%d %H:%M:%S", ts)
    end

    if line:match "^author " then
      author = line:sub(8)
    elseif line:match "^summary " then
      summary = line:sub(9)
    end
  end

  print(string.format("Author: %s\nDate: %s\nMessage: %s", author or "", timestamp or "", summary or ""))
end, {})

vim.keymap.set("n", "<leader>gs", ":GitBlameShort<CR>", { noremap = true, silent = true })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Highlights todos, notes and fixme's
vim.api.nvim_set_hl(0, "TODO", { fg = "#000000", bg = "#0DB9D7", bold = true, italic = true })
vim.api.nvim_set_hl(0, "NOTE", { fg = "#000000", bg = "#10B981", bold = true, italic = true })
vim.api.nvim_set_hl(0, "FIXME", { fg = "#ffffff", bg = "#DB4B4B", bold = true, italic = true })
vim.api.nvim_set_hl(0, "INFO", { fg = "#000000", bg = "#FBBF24", bold = true, italic = true })

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "WinEnter" }, {
  pattern = '*',
  callback = function()
    vim.fn.matchadd('TODO', "TODO")
    vim.fn.matchadd('NOTE', "NOTE")
    vim.fn.matchadd('FIXME', "FIXME")
    vim.fn.matchadd('INFO', "INFO")
  end,
})
