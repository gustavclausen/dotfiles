local M = {}

M.theme = "github"

M.languages = {
  bash = {
    language_server = "bashls",
    language_server_settings = nil,
    treesitter = { "bash" },
    tools = { "bash-language-server", "shfmt", "shellcheck" },
    filetype = "sh",
    formatter_config = {
      require("formatter.filetypes.sh").shfmt,
    },
    lint_config = { "shellcheck" },
  },
  docker = {
    language_server = "dockerls",
    language_server_settings = nil,
    treesitter = { "dockerfile" },
    tools = { "dockerfile-language-server" },
    filetype = "dockerfile",
    formatter_config = nil,
    lint_config = nil,
  },
  json = {
    language_server = "jsonls",
    language_server_settings = {
      format = { enabled = false },
      schemas = {
        {
          description = "Package config",
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package",
        },
      },
    },
    treesitter = { "json" },
    tools = { "json-lsp", "prettier" },
    filetype = "json",
    formatter_config = {
      require("core.plugins.formatters.prettier"),
    },
    lint_config = nil,
  },
  markdown = {
    language_server = "marksman",
    language_server_settings = nil,
    treesitter = { "markdown", "markdown_inline" },
    tools = { "marksman", "markdownlint" },
    filetype = "markdown",
    formatter_config = {
      require("core.plugins.formatters.prettier"),
    },
    lint_config = { "markdownlint" },
  },
  lua = {
    language_server = "lua_ls",
    language_server_settings = {
      cmd = { "lua-language-server" },
      format = {
        enable = false,
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
    },
    treesitter = { "lua" },
    tools = { "lua-language-server", "stylua" },
    filetype = "lua",
    formatter_config = {
      require("formatter.filetypes.lua").stylua,
    },
    lint_config = nil,
  },
  terraform = {
    language_server = "terraformls",
    language_server_settings = nil,
    treesitter = "hcl",
    tools = { "terraform-ls" },
    filetype = "terraform",
    formatter_config = {
      require("formatter.filetypes.terraform").terraformfmt,
    },
    lint_config = nil,
  },
  yaml = {
    language_server = "yamlls",
    language_server_settings = {
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
      schemas = {
        kubernetes = "*.yaml",
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
        ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
      },
      format = { enabled = false },
      validate = false,
      completion = true,
      hover = true,
    },
    extra_attach = function(bufnr)
      if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
        vim.diagnostic.disable()
      end
    end,
    treesitter = "yaml",
    tools = { "yaml-language-server", "yamllint", "prettier" },
    filetype = "yaml",
    formatter_config = {
      require("core.plugins.formatters.prettier"),
    },
    lint_config = { "yamllint" },
  },
  typescript = {
    language_server = "tsserver",
    language_server_settings = nil,
    treesitter = nil,
    tools = { "typescript-language-server", "prettier", "eslint_d" },
    filetype = "typescript",
    formatter_config = {
      require("core.plugins.formatters.prettier"),
    },
    lint_config = nil,
  },
  go = {
    language_server = "gopls",
    language_server_settings = nil,
    treesitter = "go",
    tools = { "gopls" },
    filetype = "go",
    formatter_config = {
      require("formatter.filetypes.go").goimports,
      require("formatter.filetypes.go").gofumpt,
    },
    lint_config = nil,
  },
  toml = {
    language_server = nil,
    language_server_settings = nil,
    treesitter = "toml",
    tools = {},
    filetype = "toml",
    formatter_config = nil,
    lint_config = nil,
  },
  vim = {
    language_server = nil,
    language_server_settings = nil,
    treesitter = "vim",
    tools = {},
    filetype = "vim",
    formatter_config = nil,
    lint_config = nil,
  },
  python = {
    language_server = "pyright",
    language_server_settings = nil,
    treesitter = "python",
    tools = { "pyright" },
    filetype = "python",
    formatter_config = {
      require("formatter.filetypes.python").black,
    },
    lint_config = nil,
  },
  helm = {
    language_server = "helm_ls",
    language_server_settings = nil,
    tools = { "helm-ls" },
    treesitter = nil,
    filetype = "helm",
    formatter_config = nil,
    lint_config = nil,
  },
}

return M
