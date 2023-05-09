local M = {}

function M.setup()
  require("todo-comments").setup({
    highlight = {
      pattern = [[.*<(KEYWORDS)(\([^\)]*\))?:]],
    },
    search = {
      pattern = [[\b(KEYWORDS)(\([^\)]*\))?:]],
    },
  })
end

return M
