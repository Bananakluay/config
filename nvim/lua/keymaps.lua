-- leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- enter command mode with ;
map("n", ";", ":", { noremap = true, silent = false, desc = "Command Mode" })

-- clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear Search Highlight" })
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear Search Highlight" })

-- exit insert mode quickly
map("i", "jk", "<Esc>", { silent = true, desc = "Exit Insert Mode" })

-- save / quit
map({ "i", "x", "n", "s" }, "<leader>w", "<cmd>w<CR><Esc>", { silent = true, desc = "Save File" })
map("n", "<leader>q", "<cmd>q<CR>", { silent = true, desc = "Quit" })

-- window navigation
map("n", "<C-h>", "<C-w>h", { silent = true, desc = "Go to Left Window" })
map("n", "<C-j>", "<C-w>j", { silent = true, desc = "Go to Lower Window" })
map("n", "<C-k>", "<C-w>k", { silent = true, desc = "Go to Upper Window" })
map("n", "<C-l>", "<C-w>l", { silent = true, desc = "Go to Right Window" })

-- resize windows
map("n", "<C-Up>", "<cmd>resize +2<CR>", { silent = true, desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { silent = true, desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { silent = true, desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { silent = true, desc = "Increase Window Width" })

-- buffer navigation
map("n", "<S-l>", "<cmd>bnext<CR>", { silent = true, desc = "Next Buffer" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { silent = true, desc = "Previous Buffer" })
map("n", "]b", "<cmd>bnext<CR>", { silent = true, desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<CR>", { silent = true, desc = "Previous Buffer" })

-- buffer management
map("n", "<leader>x", "<cmd>bdelete<CR>", { silent = true, desc = "Delete Buffer" })
map("n", "<leader>ba", "<cmd>%bd<CR>", { silent = true, desc = "Delete All Buffers" })
map("n", "<leader>bo", "<cmd>%bd|e#|bd#<CR>", { silent = true, desc = "Delete Other Buffers" })

-- split windows
map("n", "<leader>ws", "<cmd>split<CR>", { silent = true, desc = "Split Window Below" })
map("n", "<leader>wv", "<cmd>vsplit<CR>", { silent = true, desc = "Split Window Right" })
map("n", "<leader>wx", "<cmd>close<CR>", { silent = true, desc = "Close Window" })

-- better indenting
map("v", "<", "<gv", { silent = true, desc = "Indent Left" })
map("v", ">", ">gv", { silent = true, desc = "Indent Right" })

-- move selected lines
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move Selection Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move Selection Up" })

-- move normal lines
map("n", "<A-j>", "<cmd>m .+1<CR>==", { silent = true, desc = "Move Line Down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==", { silent = true, desc = "Move Line Up" })

-- new file
map("n", "<leader>fn", "<cmd>enew<CR>", { silent = true, desc = "New File" })

-- preserve cursor position
local function save_cursor(fn)
  local pos = vim.api.nvim_win_get_cursor(0)
  fn()
  pcall(vim.api.nvim_win_set_cursor, 0, pos)
end

-- copy whole file
map("n", "<leader>y", function()
  save_cursor(function()
    vim.cmd("normal! ggVGy")
  end)
end, { silent = true, desc = "Copy Entire File" })

-- copy whole file to system clipboard
map("n", "<leader>Y", function()
  save_cursor(function()
    vim.cmd('normal! ggVG"+y')
  end)
end, { silent = true, desc = "Copy Entire File to Clipboard" })

-- indent whole file
map("n", "<leader>=", function()
  save_cursor(function()
    vim.cmd("normal! gg=G")
  end)
end, { silent = true, desc = "Indent Entire File" })

-- search results stay centered
map("n", "n", "nzzzv", { silent = true, desc = "Next Search Result" })
map("n", "N", "Nzzzv", { silent = true, desc = "Previous Search Result" })

-- better paste in visual mode
map("x", "p", '"_dP', { silent = true, desc = "Paste Without Losing Register" })
