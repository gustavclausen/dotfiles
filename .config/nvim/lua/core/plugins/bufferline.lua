local M = {
  "akinsho/bufferline.nvim",
  version = "v3.*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

M.config = function()
  require("bufferline").setup()

  vim.api.nvim_set_keymap("n", "<c-n>", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = false })
  vim.api.nvim_set_keymap("n", "<c-p>", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = false })
  vim.api.nvim_set_keymap("n", "<c-q>", "<cmd>BufferLinePickClose<CR>", { noremap = true, silent = false })
end

return M
