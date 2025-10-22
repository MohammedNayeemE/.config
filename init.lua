-- ~/.config/nvim/init.lua
-- Main entry point for Neovim configuration

-- Bootstrap lazy.nvim
require("config.lazy")

-- Load core settings
require("config.options")
require("config.keymaps")
require("config.autocmds")
