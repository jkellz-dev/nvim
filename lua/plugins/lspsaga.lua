local M = {}

function M.setup()
  require("lspsaga").setup({
    -- ui = {
    --   kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
    --   colors = require("catppuccin.groups.integrations.lsp_saga").custom_colors(),
    -- },
    symbols_in_winbar = {
      enable = true,
      separator = " ",
      hide_keyword = true,
      show_file = true,
      folder_level = 2,
    },
    outline = {
      layout = 'float',
    },
  })
end

return M
