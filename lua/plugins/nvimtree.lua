local nvimtree = {}

function nvimtree.setup()
  require("nvim-tree").setup({
    hijack_netrw = true,
    open_on_setup = true,
    open_on_setup_file = false,
    open_on_tab = false,
    sync_root_with_cwd = false,
    respect_buf_cwd = false,
    sort_by = "name",
    view = {
      adaptive_size = false,
      mappings = {
        list = {
          --    { key = "u", action = "dir_up" },
        },
      },
    },
    git = {
      enable = true,
      ignore = false,
      show_on_dirs = true,
    },
    hijack_directories = {
      enable = false,
      auto_open = true,
    },
    update_focused_file = {
      enable = false,
      update_root = false,
    },
    renderer = {
      group_empty = true,
      highlight_git = true,
    },
    filters = {
      dotfiles = false,
    },
  })
end

return nvimtree
