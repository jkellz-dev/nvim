local utils = require('plugins.helm.utils')

local M = {}

function M.setup()
  vim.filetype.add({
    extension = {
      yaml = utils.yaml_filetype,
      yml = utils.yaml_filetype,
      tmpl = utils.tmpl_filetype,
      tpl = utils.tpl_filetype
    },
    filename = {
      ["Chart.yaml"] = "yaml",
      ["Chart.lock"] = "yaml",
    }
  })

  local events = { "BufNewFile", "BufRead" }

  local au_helm = vim.api.nvim_create_augroup("Helm", {})

  vim.api.nvim_create_autocmd(events, {
    pattern = "helm*",
    group = au_helm,
    command = "setlocal commentstring={{/*\\ %s\\ */}}",
  })

  local configs = require('lspconfig.configs')
  local lspconfig = require('lspconfig')
  local util = require('lspconfig.util')

  if not configs.helm_ls then
    configs.helm_ls = {
      default_config = {
        cmd = { "helm_ls", "serve" },
        filetypes = { 'helm' },
        root_dir = function(fname)
          return util.root_pattern('Chart.yaml')(fname)
        end,
      },
    }
  end

  lspconfig.helm_ls.setup {
    filetypes = { "helm" },
    cmd = { "helm_ls", "serve" },
  }
end

return M
