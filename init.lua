--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

--]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'custom.keybindings'

require 'custom.auto-commands'

-- NOTE: Here is where you install your plugins.

require 'custom.plugins.init'

require('custom.plugins.delete')

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
        vim.api.nvim_buf_delete(selection.bufnr, { force = true })
        vim.schedule(buffer_searcher)
      end
      local delete_multiple_buf = function()
        local picker = action_state.get_current_picker(prompt_bufnr)
        local selection = picker:get_multi_selection()
        for _, entry in ipairs(selection) do
          vim.api.nvim_buf_delete(entry.bufnr, { force = true })
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
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--
-- vim.schedule(buffer_searcher)
vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- vim.api.nvim_set_keymap('n', '<leader>s', '<cmd>lua require("custom.switch-case").switch_case()<CR>', {noremap = true, silent = true})
