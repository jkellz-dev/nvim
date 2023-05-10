local M = {}

function M.setup()
  require('aerial').setup({
    backends = { "treesitter", "lsp", "markdown", "man" },
    layout = {
      width = 25,
      default_direction = "right",
      placement = "edge",
    },
    open_automatic = true,
    attach_mode = "global",
  })
end

return M
