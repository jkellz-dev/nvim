local M = {}

function M.setup()
  require("bufferline").setup({
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
    options = {
      mode = "buffers",                    -- set to "tabs" to only show tabpages instead
      numbers = "buffer_id",
      close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
      right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
      middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
      indicator = {
        style = "icon",
      },
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 30,
      max_prefix_length = 30,
      truncate_names = true,
      tab_size = 30,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = true,
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        return "(" .. count .. ")"
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          text_align = "left",
          separator = false,
        },
      },
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      get_element_icon = function(element)
        -- element consists of {filetype: string, path: string, extension: string, directory: string}
        -- This can be used to change how bufferline fetches the icon
        -- for an element e.g. a buffer or a tab.
        -- e.g.
        local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
        return icon, hl
        -- -- or
        -- local custom_map = {my_thing_ft: {icon = "my_thing_icon", hl}}
        -- return custom_map[element.filetype]
      end,
      show_close_icon = true,
      show_tab_indicators = true,
      show_duplicate_prefix = true,
      persist_buffer_sort = true,
      separator_style = "slant",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
      sort_by = "id",
    },
  })
end

return M
