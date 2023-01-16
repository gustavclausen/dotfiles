local map = vim.keymap.set
local wk = require("which-key")

-- Navigate between splits
map("n", "<C-h>", "<C-W>h")
map("n", "<C-j>", "<C-W>j")
map("n", "<C-k>", "<C-W>k")
map("n", "<C-l>", "<C-W>l")

map("n", "Q", "<cmd>qall<CR>") -- Close all buffers and quit vim

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
    name = "Search",
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
  -- neo-tree
  e = { "<cmd>Neotree<CR>", "Show and/or focus on tree explorer" },
  -- misc
  m = {
    name = "Misc",
    l = {
      name = "List",
      b = {
        "<cmd>Telescope buffers<CR>",
        "Lists open buffers in current neovim instance",
      },
      c = {
        "<cmd>Telescope command_history<CR>",
        "Lists commands that were executed recently and reruns them when selected",
      },
      s = {
        "<cmd>Telescope search_history<CR>",
        "Lists searches that were executed recently and reruns them when selected",
      },
    },
    t = { "<cmd>ToggleTerm direction=float<CR>", "Toggle terminal" },
    g = { name = "Git" },
  },
}, { prefix = "<leader>", mode = "n" })
