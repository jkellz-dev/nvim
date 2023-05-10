local M = {}

function M.setup()
  require('gitblame')
  vim.g.gitblame_display_virtual_text = 0     -- Disable virtual text
  vim.g.gitblame_date_format = '%r'
  vim.g.gitblame_message_template = '<sha> | <summary> • <date> • <author>'
end

return M
