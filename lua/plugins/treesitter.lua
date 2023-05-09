local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "c",
      "cpp",
      "cmake",
      "bash",
      "dockerfile",
      "html",
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
      "typescript",
      "vim",
    },
    sync_install = false,
    highlight = {
      enable = true,
    },
  })
  local vim = vim
  local opt = vim.opt

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
