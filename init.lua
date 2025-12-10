-- ~/.config/nvim/init.lua
-- Main entry point for Neovim configuration

-- Bootstrap lazy.nvim
require("config.lazy")

-- Load core settings
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("oil").setup()
--
vim.opt.guicursor = {
	"n-v-c:block-Cursor/lCursor", -- Normal, Visual, Command modes: block cursor
	"i-ci-ve:ver25-Cursor/lCursor", -- Insert, Command-line insert modes: vertical bar
	"r-cr:hor20-Cursor/lCursor", -- Replace modes: horizontal bar
	"o:hor50-Cursor/lCursor", -- Operator-pending: horizontal bar
	"a:blinkwait700-blinkoff400-blinkon250", -- Blink settings for all modes
}

-- Define the cursor highlight colors
vim.api.nvim_set_hl(0, "Cursor", { bg = "#ffffff" })
vim.api.nvim_set_hl(0, "lCursor", { bg = "#ffffff" })
