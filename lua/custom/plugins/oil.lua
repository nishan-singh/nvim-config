return {
  {
    'stevearc/oil.nvim',
    lazy = true,
    config = function()
      require('oil').setup { keymaps = { ['q'] = 'actions.close' } }
    end,
    keys = {
      { '=', '<cmd>Oil<cr>', mode = 'n', desc = 'Open Filesystem' },
      { '-', '<cmd>Oil --float<cr>', mode = 'n', desc = 'Open Floating Filesystem' },
    },
  },
}
