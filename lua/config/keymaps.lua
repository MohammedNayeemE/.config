-- ~/.config/nvim/lua/config/keymaps.lua
-- General keymaps

local keymap = vim.keymap.set

-- Clear search highlight
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostics
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
keymap("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic Error" })
keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list" })

-- Terminal mode
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Window navigation
keymap("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
keymap("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })
keymap("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to lower window" })
keymap("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to upper window" })

-- Buffer navigation
keymap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
keymap("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- Better indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move lines
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move line up" })

-- Save file
keymap({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
