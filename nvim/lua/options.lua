-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- Core behavior
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.confirm = true
opt.autoread = true

-- UI
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = false
opt.wrap = false
opt.pumheight = 10
opt.pumwidth = 40
opt.fillchars = { eob = " " }
opt.winborder = "solid"
opt.showmode = false

-- Cursor padding (prevents cursor from sticking to bottom)
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Indent
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Timing
opt.updatetime = 250
opt.timeoutlen = 400

-- File
opt.undofile = true
opt.undodir = vim.fn.stdpath("state") .. "/undo"
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.fileencoding = "utf-8"

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }

