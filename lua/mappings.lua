require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Clear search
map("i", "<esc>", "<cmd>noh<cr><esc>")
map("n", "<esc>", "<cmd>noh<cr><esc>")

-- TIP: Disable arrow keys in normal mode
map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Save file
map("i", "<C-s>", "<cmd>w<cr><esc>")
map("x", "<C-s>", "<cmd>w<cr><esc>")
map("n", "<C-s>", "<cmd>w<cr><esc>")
map("s", "<C-s>", "<cmd>w<cr><esc>")

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>")
map("n", "<C-Down>", "<cmd>resize -2<cr>")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

-- Buffer lines
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>")
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>")
map("n", "<leader>bo", "<cmd>BufferLineCloseOther<cr>")
map("n", "<leader>bx", "<cmd>BufferLinePickClose<cr>")
