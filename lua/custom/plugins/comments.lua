return {
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', lazy = true, dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { 'numToStr/Comment.nvim', opts = {} },
}
