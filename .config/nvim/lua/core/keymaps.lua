local map = vim.keymap.set
local wk = require("which-key")

-- Navigate between splits
map("n", "<C-h>", "<C-W>h")
map("n", "<C-j>", "<C-W>j")
map("n", "<C-k>", "<C-W>k")
map("n", "<C-l>", "<C-W>l")

-- Terminal
map("t", "<C-e>", "<C-\\><C-n>")
map("t", "<C-ESC>", "<C-\\><C-n>")

-- leader based (normal mode)
wk.register({
  s = {
    name = "Splits",
    v = { "<C-W>v", "Split window vertically" },
    h = { "<C-W>s", "Split window horizontally" },
    e = { "<C-W>=", "Make split windows equal width and height" },
    x = { "<cmd>close<CR>", "Close current split window" },
  },
  n = {
    h = { "<cmd>nohl<CR>", "Remove search highlight" },
  },
  t = {
    name = "Tabs",
    t = { "<cmd>tabnew<CR>", "Create new tab" },
    d = { "<cmd>tabclose<CR>", "Close current tab" },
    n = { "<cmd>tabn<CR>", "Navigate to next tab" },
    p = { "<cmd>tabn<CR>", "Navigate to previous tab" },
  },
  f = {
    name = "Files",
    f = { "<cmd>Telescope find_files<CR>", "Find files" },
    s = { "<cmd>Telescope live_grep<CR>", "Find string in files" },
  },
  -- nvim-tree
  e = { "<cmd>NvimTreeFocus<CR>", "Show and/or focus on tree explorer" },
  -- misc
  m = {
    name = "Misc",
    t = { "<cmd>ToggleTerm direction=float<CR>", "Toggle terminal" },
    g = { name = "Git" },
  },
}, { prefix = "<leader>", mode = "n" })
