---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format { async = true, lsp_fallback = true }
      end,
      "formatting",
    },

    ["<leader>gg"] = { ":tab G <CR>" },
    ["<leader>tl"] = { "<cmd> Telescope find_files cwd=./libs <CR>" },
    ["<leader>fp"] = { "<cmd> Telescope find_files cwd=./libs/product <CR>" },
    ["<leader>fj"] = { "<cmd> Telescope find_files cwd=./libs/project <CR>" },
    ["<leader>sj"] = { "<cmd> Telescope find_files cwd=./libs/project/src/project/sidebar <CR>" },
    ["<leader>fo"] = { "<cmd> Telescope find_files cwd=./libs/object <CR>" },
    ["<leader>fs"] = { "<cmd> Telescope find_files cwd=./libs/organisation <CR>" },
    ["<leader>fr"] = { "<cmd> Telescope find_files cwd=./libs/role <CR>" },
    ["<leader>ft"] = { "<cmd> Telescope find_files cwd=./libs/target <CR>" },
    ["<leader>fg"] = { "<cmd> Telescope find_files cwd=./libs/target-group <CR>" },
    ["<leader>fu"] = { "<cmd> Telescope find_files cwd=./libs/user <CR>" },
    ["<leader>fa"] = { "<cmd> Telescope find_files cwd=./apps <CR>" },
    ["<leader>fn"] = { "<cmd> Telescope find_files cwd=./libs/material <CR>" },
    ["<leader>fv"] = { "<cmd> Telescope find_files cwd=./libs/user/favorite <CR>" },
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
