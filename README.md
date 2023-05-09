# nvim

My `nvim` config, the "DavIDE" if you will.

## Keybindings

Keybindings are documented in [lua/keybindings.lua](lua/keybindings.lua), with some exceptions being set up via the plugins for which they are intended (e.g. in `plugins/autocompletion.lua`). The (N)Vim keyboard shortcuts are typically triggered by a so-called "leader" key. The leader key (configured in [init.lua](init.lua) is `<space>`.
This config uses the plugin [folke/which-key.nvim](https://github.com/folke/which-key.nvim) to configure/document the keyboard shortcuts. Its configuration is fairly self-documenting, and even provides help while using neovim by displaying a pop-up while you start typing keyboard shortcuts. If you want to see the help pop-up, just type the <leader> key. See [folke/which-key.nvim](https://github.com/folke/which-key.nvim) for more info.

## Features

- Package management with [lazy.nvim](https://github.com/folke/lazy.nvim)
- Debugging configurations for C++, Python and Rust
  - Check out the keyboard shortcuts for this.
  - Using the following packages:
    - General debugging functionality: [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) and [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
    - Extended features for Python: [mfussenegger/nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python)
    - Debugger detection/configuration for Rust: [simrat39/rust-tools.nvim](https://github.com/simrat39/rust-tools.nvim)
- LSP configurations for C++, CMake, Rust, Python, Lua, ... automatically installed using [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- Autocompletion with LSP integration, as well as for file paths and code snippets: [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
  - Automatically invoked when typing, can be invoked manually with `<C-Space>` in insert mode
- A fuzzy finder for files, file contents, and much much more: [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- A very nice file explorer [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- Code formatting
  - Keybinding `<leader>bf`
- Beautiful [catppuccin](https://github.com/catppuccin/nvim) theme
- ...

## TODO

- [ ] Autocompletion in debug evaluation contexts
- [ ] A bit of cleanup, move all plugin configs into plugins/
