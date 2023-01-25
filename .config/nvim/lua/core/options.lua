local o = vim.opt

o.termguicolors = true
o.background = "dark"
o.relativenumber = true
o.number = true
o.cursorline = true
o.signcolumn = "yes"
o.completeopt = { "menu", "menuone", "noselect", "noinsert" }
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

o.ignorecase = true
o.smartcase = true

o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.autoindent = true
o.smartindent = true
o.softtabstop = 2
o.wrap = false

o.clipboard:append("unnamedplus")
o.splitright = true
o.splitbelow = true
o.mouse = "a"
