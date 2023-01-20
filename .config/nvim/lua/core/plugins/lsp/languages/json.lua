local opts = {
  format = { enabled = false },
  schemas = {
    {
      description = "Package config",
      fileMatch = { "package.json" },
      url = "https://json.schemastore.org/package",
    },
  },
}

return opts
