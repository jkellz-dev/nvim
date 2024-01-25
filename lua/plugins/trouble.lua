local M = {}

function M.setup()
  require("trouble").setup({
    auto_close = true,
    auto_open = true,
    height = 15,
    mode = "quickfix",
    padding = false,
  })
end

return M
