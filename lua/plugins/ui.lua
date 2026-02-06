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

	-- Terminal integration
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("toggleterm").setup({
				size = 20,
				hide_numbers = true,
				shade_filetypes = {},
				shade_terminals = false,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				persist_mode = true,
				direction = "float",
				close_on_exit = true,
				float_opts = {
					border = "curved",
					width = function()
						return math.floor(vim.o.columns * 0.9)
					end,
					height = function()
						return math.floor(vim.o.lines * 0.9)
					end,
				},
			})

			-- Keymaps for different terminal configurations
			vim.keymap.set(
				"n",
				"<leader>tf",
				"<cmd>ToggleTerm direction=float<cr>",
				{ noremap = true, desc = "Terminal (float)" }
			)
			vim.keymap.set(
				"n",
				"<leader>th",
				"<cmd>ToggleTerm size=10 direction=horizontal<cr>",
				{ noremap = true, desc = "Terminal (horizontal)" }
			)
			vim.keymap.set(
				"n",
				"<leader>tv",
				"<cmd>ToggleTerm size=80 direction=vertical<cr>",
				{ noremap = true, desc = "Terminal (vertical)" }
			)
			vim.keymap.set("t", "<C-\\>", "<cmd>ToggleTerm<cr>", { noremap = true, desc = "Toggle terminal" })
		end,
	},

	-- Add to lua/plugins/ui.lua
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
		keys = {
			{
				"<leader>qs",
				function()
					require("persistence").load()
				end,
				desc = "Restore Session",
			},
			{
				"<leader>ql",
				function()
					require("persistence").load({ last = true })
				end,
				desc = "Restore Last Session",
			},
			{
				"<leader>qd",
				function()
					require("persistence").stop()
				end,
				desc = "Don't Save Session",
			},
		},
	},
	-- Add to lua/plugins/ui.lua
}
