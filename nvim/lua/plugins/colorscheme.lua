-- ~/.config/nvim/lua/plugins/colorscheme.lua
-- Theme selector with Telescope picker and persistence

local themes = {
	{ plugin = "ellisonleao/gruvbox.nvim", colorscheme = "gruvbox", label = "Gruvbox" },
	{ plugin = "folke/tokyonight.nvim", colorscheme = "tokyonight-night", label = "Tokyo Night" },
	{ plugin = "rose-pine/neovim", name = "rose-pine", colorscheme = "rose-pine", label = "Rosé Pine" },
	{ plugin = "projekt0n/github-nvim-theme", colorscheme = "github_dark", label = "GitHub Dark", transparent = true },
	{ plugin = "catppuccin/nvim", name = "catppuccin", colorscheme = "catppuccin-mocha", label = "Catppuccin Mocha" },
	{ plugin = "sainnhe/everforest", colorscheme = "everforest", label = "Everforest" },
	{ plugin = "sainnhe/gruvbox-material", colorscheme = "gruvbox-material", label = "Gruvbox Material" },
	{ plugin = "rebelot/kanagawa.nvim", colorscheme = "kanagawa", label = "Kanagawa" },
}

local default_theme = "gruvbox"

local function theme_file()
	return vim.fn.stdpath("data") .. "/colorscheme.txt"
end

local function get_saved_theme()
	local f = io.open(theme_file(), "r")
	if f then
		local name = f:read("*l")
		f:close()
		if name and name ~= "" then
			return name
		end
	end
	return default_theme
end

local function save_theme(name)
	local f = io.open(theme_file(), "w")
	if f then
		f:write(name)
		f:close()
	end
end

local function apply_theme(name)
	local ok, _ = pcall(vim.cmd.colorscheme, name)
	if not ok then
		vim.notify("Colorscheme '" .. name .. "' not found, falling back to " .. default_theme, vim.log.levels.WARN)
		vim.cmd.colorscheme(default_theme)
	end
end

local function open_theme_picker()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local saved = get_saved_theme()

	pickers
		.new({}, {
			prompt_title = "Select Theme",
			finder = finders.new_table({
				results = themes,
				entry_maker = function(entry)
					local marker = entry.colorscheme == saved and " (current)" or ""
					return {
						value = entry,
						display = entry.label .. " [" .. entry.colorscheme .. "]" .. marker,
						ordinal = entry.label .. " " .. entry.colorscheme,
					}
				end,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr, map)
				-- Live preview on cursor move
				local preview_theme = function()
					local entry = action_state.get_selected_entry()
					if entry then
						pcall(vim.cmd.colorscheme, entry.value.colorscheme)
					end
				end

				map("i", "<C-n>", function()
					actions.move_selection_next(prompt_bufnr)
					preview_theme()
				end)
				map("i", "<C-p>", function()
					actions.move_selection_previous(prompt_bufnr)
					preview_theme()
				end)
				map("n", "j", function()
					actions.move_selection_next(prompt_bufnr)
					preview_theme()
				end)
				map("n", "k", function()
					actions.move_selection_previous(prompt_bufnr)
					preview_theme()
				end)

				-- Confirm selection
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local entry = action_state.get_selected_entry()
					if entry then
						apply_theme(entry.value.colorscheme)
						save_theme(entry.value.colorscheme)
						vim.notify("Theme set to: " .. entry.value.label, vim.log.levels.INFO)
					end
				end)

				-- Restore on cancel
				actions.close:enhance({
					post = function()
						apply_theme(saved)
					end,
				})

				-- Trigger preview for the initial selection
				vim.defer_fn(preview_theme, 50)

				return true
			end,
		})
		:find()
end

-- Build the lazy.nvim plugin specs
local specs = {}
for _, theme in ipairs(themes) do
	table.insert(specs, {
		theme.plugin,
		name = theme.name or nil,
		lazy = true,
		priority = 1000,
	})
end

-- The first spec gets the config function that loads the saved theme on startup
specs[1].lazy = false
specs[1].config = function()
	-- Ensure all theme plugins are loaded before applying
	for _, theme in ipairs(themes) do
		local name = theme.name or theme.plugin:match("/(.+)$")
		pcall(require, "lazy")
		pcall(function()
			require("lazy").load({ plugins = { name } })
		end)
	end

	-- Configure github-theme with transparency
	require("github-theme").setup({
		options = {
			transparent = true,
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

	apply_theme(get_saved_theme())

	-- Register the picker keymap
	vim.keymap.set("n", "<leader>ft", open_theme_picker, { desc = "Select Theme" })

	-- Also register a command
	vim.api.nvim_create_user_command("ThemeSelect", open_theme_picker, { desc = "Open theme picker" })
end

return specs
