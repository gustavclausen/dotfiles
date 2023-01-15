local M = {
  "akinsho/toggleterm.nvim",
}

function M.config()
  local toggleterm = require("toggleterm")
  local Terminal = require("toggleterm.terminal").Terminal
  local wk = require("which-key")

  toggleterm.setup()

  local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    hidden = true,
    direction = "float",
    on_open = function()
      vim.cmd("startinsert!")
    end,
    on_close = function()
      vim.cmd("startinsert!")
    end,
  })

  vim.api.nvim_set_keymap("t", "<C-e>", "<C-\\><C-n>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("t", "<C-q>", "<C-\\><C-n><cmd>ToggleTerm<CR>", { noremap = true, silent = true })

  function _LazygitToggle()
    lazygit:toggle()
  end

  wk.register({
    t = { "<cmd> lua _LazygitToggle()<CR>", "Toggle Lazygit" },
  }, { prefix = "<leader>mg", mode = "n", noremap = true, silent = true })
end

return M
