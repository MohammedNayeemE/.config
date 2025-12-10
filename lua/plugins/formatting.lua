-- ~/.config/nvim/lua/plugins/formatting.lua

return {
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local disable_filetypes = { c = true, cpp = true }
			return {
				timeout_ms = 5000,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		-- ✅ Updated syntax (no nested {{ ... }})
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },
			html = { "prettierd", "prettier" },
			css = { "prettierd", "prettier" },
			json = { "prettierd", "prettier" },
			yaml = { "prettierd", "prettier" },
			go = { "gofumpt", "goimports" },
			c = {},
			cpp = {},
		},

		-- ✅ Add this to mimic the old {{ ... }} “stop after first available” behavior
		stop_after_first = true,
	},
}
