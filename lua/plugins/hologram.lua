local M = {}

function M.setup()
require('hologram').setup{
    auto_display = true -- WIP automatic markdown image display, may be prone to breaking
}
end

return M
