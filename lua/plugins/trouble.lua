local M = {}

function M.setup()
  require("trouble").setup({
    height = 15,
    padding = false,
    auto_open = true,
    auto_close = true,
  })
end

return M
