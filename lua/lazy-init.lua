local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    "tpope/vim-vinegar"
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    ft = "markdown",
    opts = {},
  },
  {
    "nvimdev/indentmini.nvim",
    event = "VeryLazy",
    opts = { -- trigger the plugin to load and used for conf
      only_current = true
    } 
  },
  require "plugins.which-key",
  -- require "plugins.fzf",
  require "plugins.treesitter",
  -- require "plugins.tokyonight",
  -- require "plugins.lemons",
  require "plugins.vim-fugitive",
  require "plugins.copilot",
  -- require "plugins.highlight-colors",
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

require("lazy").setup(plugins, opts)
