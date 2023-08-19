local M = {}

function M.setup()
  local null_ls = require("null-ls")

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.diagnostics.shellcheck,
    },
  })
end

return M
