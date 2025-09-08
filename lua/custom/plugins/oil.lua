return {
  {
    'stevearc/oil.nvim',
    lazy = true,
    delete_to_trash = true,
    config = function()
      require('oil').setup {  }
    end,
    keys = {
      { '-', '<cmd>Oil <cr>', mode = 'n', desc = 'Open Floating Filesystem' },
      { '<leader>oi', '<cmd>Oil .<cr>', mode = 'n', desc = 'Open Filesystem' },
    },
  },
}
