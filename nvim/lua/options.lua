-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

-- General
opt.autowrite = true
opt.confirm = true
opt.mouse = "a"
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 250
opt.timeoutlen = 400

-- Clipboard
-- On Wayland/Hyprland, install wl-clipboard:
-- sudo pacman -S wl-clipboard
opt.clipboard = "unnamedplus"

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.showmode = false
opt.laststatus = 3
opt.ruler = false
opt.pumheight = 10
opt.pumblend = 10
opt.winminwidth = 5
opt.scrolloff = 4
opt.sidescrolloff = 8

-- Invisible characters
opt.list = true
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- Editing
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.smartindent = true
opt.virtualedit = "block"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"

-- Completion
opt.completeopt = "menu,menuone,noselect"
opt.wildmode = "longest:full,full"

-- Splits
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"

-- Wrapping
opt.wrap = false
opt.linebreak = true

-- Folding
opt.foldlevel = 99
opt.foldmethod = "indent"
opt.foldtext = ""

-- Formatting behavior
opt.formatoptions = "jcroqlnt"

-- Short messages
opt.shortmess:append({
  W = true,
  I = true,
  c = true,
  C = true,
})

-- Sessions
opt.sessionoptions = {
  "buffers",
  "curdir",
  "tabpages",
  "winsize",
  "help",
  "globals",
  "skiprtp",
  "folds",
}

-- Spell
opt.spelllang = { "en" }

-- Markdown
vim.g.markdown_recommended_style = 0


