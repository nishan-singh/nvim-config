-- Your palette for modes
local palette = {
  NORMAL   = "#f0be42",
  INSERT   = "#2ed563",
  VISUAL   = "#f45ab4",
  V_LINE   = "#f45ab4",
  V_BLOCK  = "#f45ab4",
  REPLACE  = "#ed505e",
  COMMAND  = "#5088ed",
  TERMINAL = "#fa8a49"
}

-- BG color
local fg_color = "#040404"

-- Mode label text
my_mode_label = function()
  local m = vim.fn.mode()
  return (m == "n" and "NORMAL")
    or (m == "i" and "INSERT")
    or (m == "R" and "REPLACE")
    or (m == "v" and "VISUAL")
    or (m == "V" and "V_LINE")
    or (m == "" and "V_BLOCK")
    or (m == "c" and "COMMAND")
    or (m == "t" and "TERMINAL")
    or "NORMAL"
end

-- Base background
local function apply_base_statusline_hl()
  vim.api.nvim_set_hl(0, "StatusLine", {
    bg = fg_color
  })

  vim.api.nvim_set_hl(0, "StatusLineNC", {
    bg = "#212020",
    fg = "#6c7086",
  })
end

-- Apply mode pill highlight dynamically
local function apply_mode_hl()
  local key = my_mode_label()

  local c = palette[key] or palette.NORMAL
  vim.api.nvim_set_hl(0, "MySLMode", { fg = fg_color, bg = c, bold = true })
end

-- File size function (B, KB, MB, GB)
my_file_size = function()
  local file = vim.fn.expand("%:p")
  if file == "" or vim.fn.filereadable(file) == 0 then
    return ""
  end

  local size = vim.fn.getfsize(file)
  if size < 0 then return "" end -- buffer might not be a file

  if size < 1024 then
    return string.format("%d B", size)
  elseif size < 1024 * 1024 then
    return string.format("%.2f KB", size / 1024)
  elseif size < 1024 * 1024 * 1024 then
    return string.format("%.2f MB", size / (1024 * 1024))
  else
    return string.format("%.2f GB", size / (1024 * 1024 * 1024))
  end
end

-- Build statusline with mode pill highlighted separately
vim.o.statusline = table.concat({
  "%#MySLMode#",
  " %{v:lua.my_mode_label()} ",
  "%* ",
  "%<%f %m%r",
  "%=",
  "%{v:lua.my_file_size()} ",
  "%y ",
  "%#MySLMode#",
  " %l:%c %p%% ",
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = apply_base_statusline_hl,
})

-- Update on mode change and reapply on colorscheme change
vim.api.nvim_create_autocmd({ "ModeChanged", "WinEnter", "BufEnter" }, {
  callback = apply_mode_hl,
})

