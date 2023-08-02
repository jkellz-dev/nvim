local M = {}

function M.setup()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "awk_ls",
      "bashls",
      "bufls",
      "clojure_lsp",
      "cmake",
      "csharp_ls",
      "cssls",
      "dockerls",
      "gopls",
      "golangci_lint_ls",
      "html",
      "jsonls",
      "lua_ls",
      "marksman",
      "pyright",
      "rust_analyzer",
      "sqlls",
      "terraformls",
      "tsserver",
      "yamlls",
    },
    -- automatic_installation = true,
    automatic_installation = { exclude = { "clangd", "helm_ls" } }
  })
end

return M
