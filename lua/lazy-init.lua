-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
    event = "InsertEnter",
  },
  {
    "barrett-ruth/live-server.nvim",
    build = "pnpm add -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    ft = "markdown",
    opts = {},
  },
  --  This is equivalent to:
  --    require('telescope').setup({})
  -- require "plugins.telescope",
  require "plugins.highlight-colors",
  require "plugins.which-key",
  require "plugins.fzf",
  -- require "plugins.lspconfig",
  require "plugins.conform",
  require "plugins.treesitter",
  -- require "plugins.nvim-cmd",
  require "plugins.tokyonight",
  require "plugins.oil",
  require "plugins.mini",
  require "plugins.vim-fugitive",
  -- require "plugins.hard-time",
  require "plugins.copilot",
  require "plugins.autopairs",
  --
  -- require "kickstart.plugins.indent_line",
  -- require "kickstart.plugins.lint",
  -- require "kickstart.plugins.gitsigns", -- adds gitsigns recommend keymaps
}

local opts = {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
}

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup(plugins, opts)
