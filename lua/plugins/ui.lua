-- ~/.config/nvim/lua/plugins/ui.lua

return {
	-- Auto-pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- Comment toggling
	{
		"numToStr/Comment.nvim",
		opts = {},
	},

	-- Indentation guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "auto",
				component_separators = "|",
				section_separators = "",
			},
		},
	},

	-- Which-key for keybinding hints
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").setup()
			require("which-key").add({
				{ "<leader>c", group = "Code" },
				{ "<leader>d", group = "Document" },
				{ "<leader>r", group = "Rename" },
				{ "<leader>s", group = "Search" },
				{ "<leader>w", group = "Workspace" },
				{ "<leader>t", group = "Toggle" },
				{ "<leader>h", group = "Git Hunk", mode = { "n", "v" } },
			})
		end,
	},
}
