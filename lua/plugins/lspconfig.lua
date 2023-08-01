local M = {}

local navic = require("nvim-navic")
local lspformat = require("lsp-format")
local util = require('lspconfig.util')

local function on_attach(client, bufnr)
  navic.attach(client, bufnr)

  lspformat.on_attach(client)
end

function M.mason_setup()
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

function M.setup()
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "use" },
        },
      },
    },
  })

  -- Rust and clangd are setup in their respective files in plugins/
  lspconfig.bashls.setup { { capabilities = capabilities, on_attach = on_attach } }
  lspconfig.bufls.setup { { capabilities = capabilities, on_attach = on_attach } }
  lspconfig.cmake.setup({ capabilities = capabilities })
  lspconfig.cssls.setup { { capabilities = capabilities, on_attach = on_attach } }
  lspconfig.clojure_lsp.setup { { capabilities = capabilities, on_attach = on_attach } }
  lspconfig.csharp_ls_lsp.setup { { capabilities = capabilities, on_attach = on_attach } }
  lspconfig.dockerls.setup({ capabilities = capabilities, on_attach = on_attach })
  lspconfig.html.setup { { capabilities = capabilities, on_attach = on_attach } }
  lspconfig.jsonls.setup({ capabilities = capabilities, on_attach = on_attach })
  lspconfig.marksman.setup { { capabilities = capabilities, on_attach = on_attach } }
  lspconfig.pyright.setup({ capabilities = capabilities, on_attach = on_attach })
  lspconfig.sqlls.setup { { capabilities = capabilities, on_attach = on_attach } }
  lspconfig.terraformls.setup { { capabilities = capabilities, on_attach = on_attach } }
  lspconfig.tsserver.setup { { capabilities = capabilities, on_attach = on_attach } }
  lspconfig.yamlls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "yaml" },
    settings = {
      yaml = {
        hover = true,
        completion = true,
        keyOrdering = false,
        format = {
          enable = true,
        },
        schemas = {
          ["https://bitbucket.org/atlassianlabs/atlascode/raw/675090546c756c95a8be83a91abbb80dfd6ae43c/resources/schemas/pipelines-schema.json"] = "/bitbucket-pipelines.yml",
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
        }
      }
    }
  }
end

return M
