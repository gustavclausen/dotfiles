local opts = {
  cmd = { "lua-language-server" },
  format = {
    enable = false, -- null-ls handles the formatting
  },
  diagnostics = {
    globals = { "vim", "describe" },
  },
  workspace = {
    library = {
      [vim.fn.expand("$VIMRUNTIME/lua")] = true,
      [vim.fn.stdpath("config") .. "/lua"] = true,
    },
  },
}

return opts
