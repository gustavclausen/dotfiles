local nls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

nls.setup({
  sources = {
    nls.builtins.formatting.stylua,
    nls.builtins.diagnostics.eslint_d,
    nls.builtins.formatting.terraform_fmt,
    nls.builtins.formatting.black,
    nls.builtins.formatting.goimports,
    nls.builtins.formatting.gofumpt,
    nls.builtins.code_actions.shellcheck,
    nls.builtins.diagnostics.vale,
  },
  on_attach = function(client, bufnr)
    local wk = require("which-key")
    local default_options = { silent = true, noremap = true }

    wk.register({
      F = { "<cmd>lua require('core.plugins.lsp.utils').toggle_autoformat()<cr>", "Toggle format on save" },
    }, { prefix = "<leader>m", mode = "n", default_options })

    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          if AUTOFORMAT_ACTIVE then -- global var defined in functions.lua
            vim.lsp.buf.format({ bufnr = bufnr })
          end
        end,
      })
    end
  end,
})
