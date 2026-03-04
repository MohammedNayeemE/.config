return {
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
}
