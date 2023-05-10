local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "bash",
      "c",
      "cmake",
      "cpp",
      "css",
      "dockerfile",
      "go",
      "gomod",
      "gowork",
      "hcl",
      "html",
      "http",
      "java",
      "javascript",
      "json",
      "kotlin",
      "latex",
      "llvm",
      "lua",
      "make",
      "markdown",
      "proto",
      "python",
      "regex",
      "ruby",
      "rust",
      "swift",
      "toml",
      "typescript",
      "vim",
      "yaml",
      "zig"
    },
    sync_install = false,
    highlight = {
      enable = true,
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
      ---- list of languages you want to disable the plugin for
      disable = { 'jsx', 'cpp' },
      -- Which query to use for finding delimiters
      -- query = 'rainbow-parens',
      -- Highlight the entire buffer all at once
      -- strategy = require('ts-rainbow').strategy.global,
    },
  })
  -- local vim = vim
  -- local opt = vim.opt

  -- opt.foldmethod = "expr"
  -- opt.foldexpr = "nvim_treesitter#foldexpr()"
  --
  -- local autoCommands = {
  --   open_folds = {
  --     { "BufReadPost,FileReadPost", "*", "normal zR" },
  --   },
  -- }
  --
  -- require("utils/autocommands").nvim_create_augroups(autoCommands)
end

return M
