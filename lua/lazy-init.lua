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
  require "plugins.render-markdown",
  require "plugins.indent-mini",
  require "plugins.which-key",
  require "plugins.fff",
  require "plugins.treesitter",
  -- require "plugins.tokyonight",
  -- require "plugins.lemons",
  require "plugins.vim-fugitive",
  require "plugins.copilot",
  -- require "plugins.highlight-colors",
}

require("lazy").setup(plugins, opts)
