local M = {}

M.theme = "catppuccin"

M.treesitter_ensure_installed = {
  "bash",
  "css",
  "dockerfile",
  "go",
  "hcl",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "toml",
  "vim",
  "yaml",
}
M.mason_tool_installer_ensure_installed = {
  "bash-language-server",
  "dockerfile-language-server",
  "json-lsp",
  "marksman",
  "lua-language-server",
  "terraform-ls",
  "yaml-language-server",
  -- Formatter
  "black",
  "prettier",
  "stylua",
  -- Linter
  "eslint_d",
  "shellcheck",
  "tflint",
  "vale",
  "yamllint",
}

return M
