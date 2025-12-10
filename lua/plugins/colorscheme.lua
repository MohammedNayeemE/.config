-- ~/.config/nvim/lua/plugins/colorscheme.lua

-- return {
--   "folke/tokyonight.nvim",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("tokyonight-night")
--   end,
-- }
-- ~/.config/nvim/lua/plugins/colorscheme.lua

-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	priority = 1000,
-- 	config = function()
-- 		require("rose-pine").setup({
-- 			variant = "dawn", -- auto, main, moon, or dawn
-- 			dark_variant = "main", -- main, moon, or dawn
-- 			dim_inactive_windows = false,
-- 			extend_background_behind_borders = true,
--
-- 			styles = {
-- 				bold = true,
-- 				italic = true,
-- 				transparency = false,
-- 			},
--
-- 			-- Optional: customize specific highlight groups
-- 			-- highlight_groups = {
-- 			--   Comment = { italic = true },
-- 			--   Keyword = { bold = true },
-- 			-- },
-- 		})
--
-- 		vim.cmd.colorscheme("rose-pine")
-- 	end,
-- }
--

return {
	"projekt0n/github-nvim-theme",
	priority = 1000,
	config = function()
		require("github-theme").setup({
			-- Optional: customize the theme
			options = {
				transparent = true, -- Enable transparency
				terminal_colors = true,
				dim_inactive = false,
				styles = {
					comments = "italic",
					functions = "NONE",
					keywords = "bold",
					variables = "NONE",
				},
			},
		})
		-- Use github_dark or github_dark_dimmed for better transparency
		vim.cmd.colorscheme("github_dark")
	end,
}
