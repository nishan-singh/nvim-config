return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>sh", "<cmd>FzfLua help_tags<cr>", desc = "Help Tags" },
      { "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
      { "<leader>sf", "<cmd>FzfLua files<cr>", desc = "Files" },
      { "<leader>ss", "<cmd>FzfLua builtin<cr>", desc = "Builtin" },
      { "<leader>sw", "<cmd>FzfLua grep_cword<cr>", desc = "Grep Cword" },
      { "<leader>sg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },
      { "<leader>sd", "<cmd>FzfLua diagnostics<cr>", desc = "Diagnostics" },
      { "<leader>sr", "<cmd>FzfLua resume<cr>", desc = "Resume" },
      { "<leader>s.", "<cmd>FzfLua oldfiles<cr>", desc = "Old Files" },
      { "<leader><leader>", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
    },
    opts = {
      "ivy",
      grep = {
        winopts = {
          height = 0.30,  -- take ~40% of the screen height
          width  = 1.00,  -- full width
          row    = 1.00,  -- align bottom
          col    = 0.50,  -- center horizontally
          preview = {
            default = "bat",   -- or "builtin"
            layout  = "vertical", -- actually means stacked left/right in ivy mode
            vertical = "right:50%", -- 50% width for preview
            flip_columns = 120, -- only split if enough columns
          },
        },
      },
      keymap = {
        builtin = {
          ['<C-u>'] = 'preview-page-up',
          ['<C-d>'] = 'preview-page-down',
        },
        fzf = {
          ["ctrl-q"] = "select-all+accept",
        }
      },
    }
  },
}
