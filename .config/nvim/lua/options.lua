local opt = vim.opt

vim.cmd([[colorscheme catppuccin]])
opt.termguicolors = true
opt.background = "dark"
opt.relativenumber = true
opt.number = true
opt.cursorline = true
opt.signcolumn = "yes"

opt.ignorecase = true
opt.smartcase = true

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.smartindent = true
opt.softtabstop = 2
opt.wrap = false

opt.clipboard:append("unnamedplus")
opt.splitright = true
opt.splitbelow = true
opt.mouse = "a"
