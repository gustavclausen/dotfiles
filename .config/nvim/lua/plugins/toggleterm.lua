local status, toggleterm = pcall(require, "toggleterm")
if not status then
  return
end

toggleterm.setup()

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  hidden = true,
  direction = "float",
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  on_close = function()
    vim.cmd("startinsert!")
  end,
})

function _LazygitToggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _LazygitToggle()<CR>", { noremap = true, silent = true })
