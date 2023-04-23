local M = {
  "kazhala/close-buffers.nvim",
}

function M.config()
  require("close_buffers").setup({})

  local wk = require("which-key")
  local default_options = { silent = true, noremap = true }

  wk.register({
    d = {
      "<cmd>lua require('close_buffers').delete({ type = 'hidden' })<CR>",
      "Close hidden buffers",
    },
  }, { prefix = "<leader>b", mode = "n", default_options })
end

return M
