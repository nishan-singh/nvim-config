local M = {}

local PAIRS = {
  ["("] = ")",
  ["["] = "]",
  ["{"] = "}",
  ['"'] = '"',
  ["'"] = "'",
  ["`"] = "`",
}

-- Optional: disable for certain filetypes (e.g., when using vimtex)
local DISABLED_FTS = {
  text = true,
}

local function ft_disabled()
  return DISABLED_FTS[vim.bo.filetype] == true
end

-- a generic function to do different actions like insert a new line or
-- remove both brackets if <C-h> or <BS> is pressed
local function do_action(default_action, pair_action)
  if ft_disabled() then return default_action end
  local col = vim.fn.col(".")
  local line = vim.fn.getline(".")
  local prevc = line:sub(col - 1, col - 1)
  local nextc = line:sub(col, col)
  if PAIRS[prevc] and PAIRS[prevc] == nextc then
    return pair_action
  end
  return default_action
end

function M.setup()
  local map = vim.keymap.set
  local iopts = { expr = true, noremap = true, silent = true }

  for open, close in pairs(PAIRS) do
    map("i", open, function()
      if ft_disabled() then return open end

      local col = vim.fn.col(".")
      local line = vim.fn.getline(".")
      local nextc = line:sub(col, col) -- next character under cursor

      -- Only insert pair if next character is end of line or a whitespace or a closing pair
      if nextc:match("[%)}%]]") or nextc == "" or nextc:match("%s") then
        return open .. close .. "<Left>"
      end

     return open
    end, iopts)
  end

  -- Optional: Enter between pairs -> adds a blank line in between and keeps indent
  map("i", "<CR>", function()
    return do_action("<CR>", "<CR><Esc>O")
  end, iopts)
  map("i", "<C-j>", function()
    return do_action("<CR>", "<CR><Esc>O")
  end, iopts)

  -- Deletes both chars, if it's a pair
  map("i", "<BS>", function()
    return do_action("<BS>", "<Del><BS>")
  end, iopts)
  map("i", "<C-h>", function()
    return do_action("<BS>", "<Del><BS>")
  end, iopts)
end

return M.setup()
