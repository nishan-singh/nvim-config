---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
    ["<leader>tl"] = { "<cmd> Telescope find_files cwd=./libs <CR>" },
    ["<leader>pv"] = { ":vs<CR>" },
    ["<leader>ps"] = { ":sp<CR>" },
    -- ["<leader>po"] = {  "<C-w>o<CR>" },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["C-v"] = { "C-v", "blockwise visual mode", remap = true },
  },
}

-- more keybinds!

return M
