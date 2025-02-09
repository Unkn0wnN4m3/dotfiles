-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap

map.set("i", "jk", "<ESC>", { noremap = true, silent = true })
map.set("i", "kj", "<ESC>", { noremap = true, silent = true })
