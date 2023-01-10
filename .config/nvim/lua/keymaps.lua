vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<SPACE>", "<Nop>", { noremap = true })

keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>")
keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<C-h>", "<C-W>h")
keymap.set("n", "<C-j>", "<C-W>j")
keymap.set("n", "<C-k>", "<C-W>k")
keymap.set("n", "<C-l>", "<C-W>l")

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

keymap.set("n", "<leader>tt", ":tabnew<CR>")
keymap.set("n", "<leader>td", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

keymap.set("n", "<leader>te", ":ToggleTerm direction=float<CR>")

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")

keymap.set("t", "<C-e>", "<C-\\><C-n>")
keymap.set("t", "<C-ESC>", "<C-\\><C-n>")

keymap.set("n", "<leader>rs", ":LspRestart<CR>")
