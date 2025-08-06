return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
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
      -- { "/", "<cmd>FzfLua current_buffer_fuzzy_find<cr>", desc = "Current Buffer Fuzzy Find" },
      { "<leader>s/", "<cmd>FzfLua live_grep_open_files<cr>", desc = "Live Grep Open Files" },
    },
  },
}
