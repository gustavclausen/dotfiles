local M = {
  "echasnovski/mini.nvim",
}

function M.config()
  require("mini.sessions").setup({
    directory = vim.fn.stdpath("data") .. "/session",
    file = "",
    hooks = {
      pre = {
        write = function()
          vim.cmd("tabdo NeoTreeClose")
        end,
      },
      post = {
        write = function()
          vim.cmd("tabdo NeoTreeReveal")
        end,
      },
    },
  })
  require("mini.starter").setup()
  require("mini.surround").setup()
end

return M
