local M = {}

function M.setup()
  require('zen-mode').setup({
    window = {
      options = {
        cursorline = true,
      }
    },
    -- plugins = {}
  })
end

return M
