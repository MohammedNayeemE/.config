-- ~/.config/nvim/lua/config/options.lua
-- General Neovim settings

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Mouse support
opt.mouse = "a"

-- UI
opt.showmode = false
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 10
opt.termguicolors = true
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.inccommand = "split"

-- Clipboard
opt.clipboard = "unnamedplus"

-- Indentation
opt.breakindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Files
opt.undofile = true
opt.swapfile = false
opt.backup = false

-- Timings
opt.updatetime = 250
opt.timeoutlen = 300

-- Completion
opt.completeopt = "menu,menuone,noselect"

-- Line wrapping
opt.wrap = false
