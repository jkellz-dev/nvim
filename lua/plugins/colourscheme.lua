local set = vim.opt

local colourscheme = {}

function colourscheme.setup()
  set.termguicolors = true
  set.background = "dark"

  -- Settings for onedark
  require("onedark").setup({
    style = "darker",
    highlights = {
      -- IncSearch = { fg = '#FFFFFF', bg = '#5218fa' },
      -- CurSearch = { fg = '#FFFFFF', bg = '#5218fa' },
      -- Search = { fg = '#FFFFFF', bg = '#bb3385' },
      DiagnosticVirtualTextError = { fg = '#FF7276' },
      DiagnosticVirtualTextWarn = { fg = '#FFEF00' },
      DiagnosticVirtualTextInfo = { fg = '#A4DBE8' },
      DiagnosticVirtualTextHint = { fg = '#C5B4E3' },
    }
  })
  require("onedark").load()


  -- Settings for catppuccin
  require("catppuccin").setup({
    flavour = "frappe", -- latte, frappe, macchiato, mocha
    background = {
      -- :h background
      light = "latte",
      dark = "mocha",
    },
    transparent_background = false,
    term_colors = false,
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false,   -- Force no bold
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
      barbecue = {
        dim_dirname = true,
      },
      -- bufferline = true,
      cmp = true,
      gitsigns = true,
      telescope = true,
      notify = true,
      mini = false, -- TODO: ?
      leap = true,
      lsp_saga = true,
      markdown = true,
      mason = true,
      neotree = false,
      neogit = true,
      neotest = true, -- TODO: ?
      dap = {
        enabled = true,
        enable_ui = true, -- enable nvim-dap-ui
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
      navic = { enabled = true, custom_bg = "NONE" },
      treesitter = true,
      lsp_trouble = true,
      which_key = true,
    },
  })


  -- setup must be called before loading
  vim.cmd.colorscheme("onedark")
end

return colourscheme
