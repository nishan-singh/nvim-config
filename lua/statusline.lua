vim.o.laststatus = 2

-- Your palette for modes
local palette = {
  NORMAL   = { bg = "#82aaff" },
  INSERT   = { bg = "#c3e88d" },
  VISUAL   = { bg = "#c099ff" },
  VLINE    = { bg = "#c099ff" },
  VBLOCK   = { bg = "#c099ff" },
  REPLACE  = { bg = "#ff757f" },
  COMMAND  = { bg = "#ffc777" },
  TERMINAL = { bg = "#4fd6be" },
}

-- Mode label text
my_mode_label = function()
  local m = vim.fn.mode()
  return (m == "n" and "NORMAL")
      or (m == "i" and "INSERT")
      or (m == "R" and "REPLACE")
      or (m == "v" and "VISUAL")
      or (m == "V" and "V-LINE")
      or (m == "" and "V-BLOCK")
      or (m == "c" and "COMMAND")
      or (m == "t" and "TERMINAL")
      or "NORMAL"
end

-- Apply mode pill highlight dynamically
local function apply_mode_hl()
  local key = my_mode_label()

  local c = palette[key] or palette.NORMAL
  vim.api.nvim_set_hl(0, "MySLMode", { fg = "#1b1d2d", bg = c.bg, bold = true })
  return key
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

-- Update on mode change and reapply on colorscheme change
vim.api.nvim_create_autocmd("ModeChanged", { callback = apply_mode_hl })
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "StatusLine", { fg = "#7E87B3", bg = "#2F334D" })
    apply_mode_hl()
  end,
})

apply_mode_hl()
