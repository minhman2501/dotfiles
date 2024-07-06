-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Trouble
vim.keymap.set("n", "<S-t>", "<cmd>Trouble diagnostics toggle<cr>")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
