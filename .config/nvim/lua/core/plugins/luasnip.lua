local M = {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
  },
}

function M.config()
  local vsc = require("luasnip.loaders.from_vscode")
  local lua = require("luasnip.loaders.from_lua")

  vsc.lazy_load()
  lua.load({ paths = os.getenv("HOME") .. "/.config/nvim/snippets/" })
end

return M
