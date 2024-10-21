require "nvchad.options"

vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "120"
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.spell = true
vim.opt.spelllang = { "ru", "en" }
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.foldcolumn = "0"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""

vim.opt.foldnestmax = 3
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
