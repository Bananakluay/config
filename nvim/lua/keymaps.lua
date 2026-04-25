-- leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- enter command mode with ;
map("n", ";", ":", { noremap = true })

-- clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)
map("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- exit insert mode quickly
map("i", "jk", "<Esc>", opts)

-- save / quit
map("n", "<leader>w", "<cmd>write!<CR>", opts)
map("n", "<leader>q", "<cmd>q!<CR>", opts)

-- window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- resize windows
map("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
map("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- buffer navigation
map("n", "<S-l>", "<cmd>bnext<CR>", opts)
map("n", "<S-h>", "<cmd>bprevious<CR>", opts)

-- buffer management
map("n", "<leader>x", "<cmd>silent! bdelete<CR>", opts)
map("n", "<leader>ba", "<cmd>silent! %bd<CR>", opts)
map("n", "<leader>bo", "<cmd>silent! %bd|e#|bd#<CR>", opts)

-- split windows
map("n", "<leader>ws", "<cmd>split<CR>", opts)
map("n", "<leader>wv", "<cmd>vsplit<CR>", opts)
map("n", "<leader>wq", "<cmd>close<CR>", opts)

-- keep selection when indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- move selected lines
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- preserve cursor position
local function save_cursor(fn)
	local pos = vim.api.nvim_win_get_cursor(0)
	fn()
	vim.api.nvim_win_set_cursor(0, pos)
end

-- copy whole file
map("n", "<leader>y", function()
	save_cursor(function()
		vim.cmd("normal! ggVGy")
	end)
end, { silent = true, desc = "Copy entire file" })

-- format whole file
map("n", "<leader>=", function()
	save_cursor(function()
		vim.cmd("normal! gg=G")
	end)
end, { silent = true, desc = "Indent entire file" })

-- open nvim config
map("n", "<leader>cn", function()
	require("telescope.builtin").find_files({
		cwd = vim.fn.expand("~/.config/nvim"),
	})
end, { desc = "Neovim config files" })
