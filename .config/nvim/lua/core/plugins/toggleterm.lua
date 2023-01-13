local M = {
  "akinsho/toggleterm.nvim",
}

function M.config()
  local toggleterm = require("toggleterm")
  local Terminal = require("toggleterm.terminal").Terminal

  toggleterm.setup()

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

  vim.api.nvim_set_keymap("n", "<leader>mg", "<cmd>lua _LazygitToggle()<CR>", { noremap = true, silent = true })
end

return M
