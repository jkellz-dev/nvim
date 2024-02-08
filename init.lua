-- plugins
require("plugins")
require("keybindings").setup()

-- vim settings
local set = vim.opt

set.number = true
set.relativenumber = true
set.nu = true
set.rnu = true
set.mouse = "a"

set.ic = true

set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true

set.cursorline = true

set.clipboard = "unnamedplus"

local undodir = vim.fn.expand("~/.nvim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "", 0700)
end

set.undodir = undodir
set.undofile = true

vim.api.nvim_create_autocmd("VimEnter", {
  command = "set nornu nonu | Neotree reveal",
})

local textedit = vim.api.nvim_create_augroup("filetypes", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "filetypes",
  pattern = { "*.secrets" },
  callback = function()
    set.filetype = "yaml"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "filetypes",
  pattern = { "*.md" },
  callback = function()
    set.tabstop = 2
    set.shiftwidth = 2
    set.expandtab = true
  end,
})

-- add inlay support to all buffers
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(args.buf, true)
    end
    -- whatever other lsp config you want
  end,
})
