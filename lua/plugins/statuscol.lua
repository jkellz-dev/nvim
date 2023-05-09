local M = {}

function M.setup()
  local builtin = require("statuscol.builtin")
  local cfg = {
    separator = false,
    thousands = false,
    relculright = true,
    lnumfunc = nil,
    reeval = false,
    foldfunc = nil,
    setopt = false,
    order = "NFSs",
    ft_ignore = { "startup" },
    Lnum = builtin.lnum_click,
    FoldClose = builtin.foldclose_click,
    FoldOpen = builtin.foldopen_click,
    FoldOther = builtin.foldother_click,
    DapBreakpointRejected = builtin.toggle_breakpoint,
    DapBreakpoint = builtin.toggle_breakpoint,
    DapBreakpointCondition = builtin.toggle_breakpoint,
    DiagnosticSignError = builtin.diagnostic_click,
    DiagnosticSignHint = builtin.diagnostic_click,
    DiagnosticSignInfo = builtin.diagnostic_click,
    DiagnosticSignWarn = builtin.diagnostic_click,
    GitSignsTopdelete = builtin.gitsigns_click,
    GitSignsUntracked = builtin.gitsigns_click,
    GitSignsAdd = builtin.gitsigns_click,
    GitSignsChangedelete = builtin.gitsigns_click,
    GitSignsDelete = builtin.gitsigns_click,
  }

  require("statuscol").setup(cfg)
end

return M
