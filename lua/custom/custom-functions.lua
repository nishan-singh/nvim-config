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

local builtin = require('telescope.builtin')
local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')

local buffer_searcher
buffer_searcher = function()
  builtin.buffers {
    sort_mru = true,
    attach_mappings = function(prompt_bufnr, map)
      local delete_buf = function()
        local selection = action_state.get_selected_entry()
        -- depending if you want to close or not, include this or not
        actions.close(prompt_bufnr)
        -- print(vim.inspect(selection))
        -- better print selection before first running this. I am not sure if it have a bufnr or if this field is named differently
        vim.api.nvim_buf_delete(selection.bufnr, { })
        vim.schedule(buffer_searcher)
      end
      local delete_multiple_buf = function()
        local picker = action_state.get_current_picker(prompt_bufnr)
        local selection = picker:get_multi_selection()
        for _, entry in ipairs(selection) do
          vim.api.nvim_buf_delete(entry.bufnr, { })
        end
        vim.schedule(buffer_searcher)
      end
      map('n', 'dd', delete_buf)
      map('n', '<C-d>', delete_multiple_buf)
      map('i', '<C-d>', delete_multiple_buf)
      return true
    end
  }
end

vim.keymap.set('n', '<leader><leader>', buffer_searcher, {})
