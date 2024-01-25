local M = {}

function M.setup()
  -- triggers CursorHold event faster
  vim.opt.updatetime = 200

  require("barbecue").setup({
    create_autocmd = false, -- prevent barbecue from updating itself automatically
    theme = "onedark",
  })

  vim.api.nvim_create_autocmd({
    "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
    "BufWinEnter",
    "CursorHold",
    "InsertLeave",

    -- include these if you have set `show_modified` to `true`
    "BufWritePost",
    "TextChanged",
    "TextChangedI",
  }, {
    group = vim.api.nvim_create_augroup("barbecue.updater", {}),
    callback = function()
      require("barbecue.ui").update()
    end,
  })
end

return M
