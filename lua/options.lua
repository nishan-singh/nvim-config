vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2

vim.opt.path:append "**"

-- Display all matching files when tab completing
vim.opt.wildmenu = true

-- ignore these dirs
vim.opt.wildignore:append {
  "*/node_modules/*",
  "*/.git/*",
  "*/dist/*",
  "*/build/*",
}

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Highlight all matches on previous search pattern
vim.opt.hlsearch = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Tab settings
vim.opt.tabstop = 2 -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
vim.opt.softtabstop = 2   -- how many spaces <Tab> inserts in insert mode
vim.opt.expandtab = true  -- convert tabs to spaces

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- set autocomplete max-height(C-n,C-p)
vim.opt.ph = 25

vim.cmd.highlight('IndentLineCurrent guifg=#303030')

vim.opt.grepprg = "rg --vimgrep --smart-case"
vim.opt.grepformat = "%f:%l:%c:%m"
