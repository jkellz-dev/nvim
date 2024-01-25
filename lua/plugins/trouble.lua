local M = {}

function M.setup()
  require("trouble").setup({
    auto_close = true,
    auto_open = true,
    height = 15,
    padding = false,
  })
end

return M
