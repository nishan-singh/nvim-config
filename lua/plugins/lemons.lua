return {
  "Kaikacy/Lemons.nvim",
  version = "*", -- for stable release
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("lemons")
    -- or
    -- require("lemons").load()
    -- there is no difference between these two
  end
}
