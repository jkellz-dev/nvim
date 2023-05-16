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
