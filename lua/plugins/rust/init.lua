local rust_tools = {}

function rust_tools.setup()
  local rt = require("rust-tools")

  local mason_registry = require("mason-registry")

  local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
  local codelldb_path = codelldb_root .. "adapter/codelldb"
  local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"

  local opts = {
    tools = {
      -- rust-tools options
      autoSetHints = true,
      -- hover_with_actions = true,
      inlay_hints = {
        show_parameter_hints = true,
        parameter_hints_prefix = "<- ",
        other_hints_prefix = "=> ",
        highlight = "White"
      },
      hover_actions = {
        auto_focus = true,
      }
    },
    server = {
      -- standalone = true,
      capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      on_attach = function(client, bufnr)
        require("nvim-navic").attach(client, bufnr)
        require("lsp-format").on_attach(client)
      end,

      -- checkOnSave = {
      --   allFeatures = true,
      --   overrideCommand = {
      --     "cargo",
      --     "clippy",
      --     "--workspace",
      --     "--message-format=json",
      --     "--all-targets",
      --     "--all-features",
      --   },
      -- },

      settings = {
        -- to enable rust-analyzer settings visit:
        -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
        ["rust-analyzer"] = {
          checkOnSave = {
            command = "clippy",
            allFeatures = true,
            overrideCommand = {
              'cargo', 'clippy', '--workspace', '--all-targets', '--all-features', '--message-format=json', '--', '-D',
              'warnings'
            }
          },
          assist = {
            importGranularity = "module",
            importPrefix = "self",
          },
          cargo = {
            buildScripts = {
              enable = true,
            },
            loadOutDirsFromCheck = true
          },
          procMacro = {
            enable = true
          },
        }
      },
      dap = { adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path) },
    },
  }

  rt.setup(opts)
end

return rust_tools
