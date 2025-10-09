local M = {}

local PAIRS = {
  ["("] = ")",
  ["["] = "]",
  ["{"] = "}",
  ['"'] = '"',
  ["'"] = "'",
  ["`"] = "`",
}

-- -- Optional: disable for certain filetypes (e.g., when using vimtex)
-- local DISABLED_FTS = {
--   -- tex = true,
-- }
--
-- local function ft_disabled()
--   return DISABLED_FTS[vim.bo.filetype] == true
-- end

local function blank_line()
  -- if ft_disabled() then return "<CR>" end
  local col = vim.fn.col(".")
  local line = vim.fn.getline(".")
  local prevc = line:sub(col - 1, col - 1)
  local nextc = line:sub(col, col)
  if PAIRS[prevc] and PAIRS[prevc] == nextc then
    -- insert newline, then open a line above (keeps indent), return to insert
    return "<CR><Esc>O"
  end
  return "<CR>"
end

function M.setup()
  local map = vim.keymap.set
  local iopts = { expr = true, noremap = true, silent = true }

  -- Opening chars: insert pair and place cursor in between
  for open, close in pairs(PAIRS) do
    map("i", open, function()
      -- if ft_disabled() then return open end
      return open .. close .. "<Left>"
    end, iopts)
  end

  -- Optional: Enter between pairs -> adds a blank line in between and keeps indent
  map("i", "<CR>", blank_line, iopts)
  map("i", "<C-j>", blank_line, iopts)
end

return M.setup()
