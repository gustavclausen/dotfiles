local api = vim.api

api.nvim_create_autocmd("BufWinEnter", {
  desc = "Open neo-tree on enter",
  callback = function()
    if not vim.g.neotree_opened then
      vim.cmd("Neotree")
      vim.g.neotree_opened = true
    end
  end,
})
