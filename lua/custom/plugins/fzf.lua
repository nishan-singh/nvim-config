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
