local M = {}

vim.g.mapleader = '\\'

function M.setup()
  require("which-key").setup({})

  -- insert mode
  require("which-key").register({
    ["j"] = {
      ["j"] = { "<esc>", "escape" },
    },
  }, { mode = "i" })

  -- terminal mode
  require("which-key").register({
    ['<Leader>n'] = { '<C-\\><C-n>:FloatermNew<CR>' },
    ['<Leader>['] = { '<C-\\><C-n>:FloatermPrev<CR>' },
    ['<Leader>]'] = { '<C-\\><C-n>:FloatermNext<CR>' },
    ['<C-n>'] = { '<C-\\><C-n>:FloatermNew<CR>' },
    ['<C-t>'] = { '<C-\\><C-n>:FloatermToggle<CR>' },
    ['<C-[>'] = { '<C-\\><C-n>:FloatermPrev<CR>' },
    ['<C-]>'] = { '<C-\\><C-n>:FloatermNext<CR>' },
  }, { mode = "t" })

  -- normal mode
  require("which-key").register({
    ["<C-h>"] = { "<C-w>h", "Go to the window to the left" },
    ["<C-l>"] = { "<C-w>l", "Go to the window to the right" },
    ["<C-j>"] = { "<C-w>j", "Go to the window below" },
    ["<C-k>"] = { "<C-w>k", "Go to the window above" },

    [",cc"] = { "<cmd>Lspsaga code_action<cr>", "Code actions" },
    [",,"] = { "m`A,<Esc>``j", "Append comma and move down" },
    [";;"] = { "m`A;<Esc>``j", "Append semicolon and move down" },

    -- terminal
    ['<C-t>'] = { ':FloatermToggle<CR>', "Toggle Terminal" },

    ["g"] = {
      name = "go to",
      D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto Declartion" },
      d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
      r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Go to References" },
      s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Go to Signature Help" },
      i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to Implementation" },
      t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Go to Type Definition" },
    },
    ["z"] = {
      name = "Folds",
      o = { "<cmd>foldopen<cr>", "Open fold" },
      c = { "<cmd>foldclose<cr>", "Close fold" },
      O = { "<cmd>lua require('ufo').openAllFolds<cr>", "Open all folds" },
      C = { "<cmd>lua require('ufo').closeAllFolds<cr>", "Close all folds" },
    },
    ["<tab>"] = {
      ["<tab>"] = { ":WhichKey<cr>", "Show WhichKey Help" },
    },
    ["<leader>"] = {
      ["<leader>"] = { "<cmd>Telescope find_files hidden=true<cr>", "Find files" },
      ["<tab>"] = { ":NeoTreeRevealToggle<CR>", "Toggle Neotree" },
      b = {
        name = "Buffer",
        f = { "<cmd>Neoformat<cr><cmd>w<cr>", "Format" },
        n = { "<cmd>bnext<cr>", "Next Buffer" },
        p = { "<cmd>bprev<cr>", "Previous Buffer" },
        u = { "<cmd>undo<cr>", "Undo" },
        r = { "<cmd>redo<cr>", "Redo" },
        h = { "<C-w>h", "Go to the window to the left" },
        l = { "<C-w>l", "Go to the window to the right" },
        j = { "<C-w>j", "Go to the window below" },
        k = { "<C-w>k", "Go to the window above" },
        ["<"] = { "15<C-w><", "Decrease buffer width" },
        [">"] = { "15<C-w>>", "Increase buffer width" },
        ["-"] = { "15<C-w>-", "Decrease buffer height" },
        ["+"] = { "15<C-w>+", "Increase buffer height" },
      },
      d = {
        name = "Debug",
        b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle breakpoint" },
        l = {
          "<cmd>lua require'dap.ext.vscode'.load_launchjs()<cr><cmd>lua require'dap'.continue()<cr>",
          "Launch debug session",
        },
        t = { "<cmd>lua require'dap'.terminate()<cr><cmd>lua require'dapui'.close()<cr>", "Terminate debug session" },
      },
      f = {
        name = "Fuzzy finder",
        f = { "<cmd>Telescope live_grep<cr>", "Live grep" },
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        h = { "<cmd>Telescope help_tags<cr>", "Help tags" },
        o = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
        g = { "<cmd>Telescope git_status<cr>", "Git files" },
        r = { "<cmd>Telescope lsp_references<cr>", "LSP References" },
        s = { "<cmd>Telescope spell_suggest<cr>", "Spelling Suggestions" },
        t = { "<cmd>TodoTelescope<cr>", "TODOs" },
      },
      g = {
        name = "git",
        o = { "<cmd>Neogit<cr>", "Open Neogit" },
      },
      l = {
        name = "LSP",
        a = { "<cmd>Lspsaga code_action<cr>", "Code actions" },
        d = { "<cmd>Trouble lsp_definitions<cr>", "Go to definition" },
        h = { "<cmd>ClangdSwitchSourceHeader<cr>", "Toggle header/source" },
        p = { "<cmd>Lspsaga peek_definition<cr>", "Peek definition" },
        u = { "<cmd>Trouble lsp_references<cr>", "Show usages" },
        r = { "<cmd>Lspsaga rename<cr>", "Rename" },
        x = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show line diagnostics" },
      },
      r = {
        name = "Rust",
        h = { "<cmd>lua require'rust-tools'.hover_actions.hover_actions()<cr>", "Hover actions" },
        a = { "<cmd>lua require'rust-tools'.code_action_group.code_action_group()<cr>", "Code actions" },
        r = { "<cmd>wa<cr><cmd>lua require'rust-tools'.runnables.runnables()<cr>", "Runnables" },
        d = { "<cmd>wa<cr><cmd>lua require'rust-tools'.debuggables.debuggables()<cr>", "Debuggables" },
      },
      s = {
        name = "Search",
        s = { "<cmd>lua require('searchbox').incsearch()<cr>", "Incremental search" },
        a = { "<cmd>lua require('searchbox').match_all()<cr>", "Match all" },
        r = { "<cmd>lua require('searchbox').replace()<cr>", "Replace" },
        o = { "<cmd>lua require('spectre').open()<cr>", "Open search dialogue" },
        w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Search current word" },
        f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Search in current file" },
      },
      t = { name = "File Tree", t = { "<cmd>Neotree toggle<cr>", "Toggle" } },
      u = {
        name = "Undotree",
        t = { "<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>", "Toggle" },
        f = { "<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>", "Focus" },
      },
      x = {
        name = "Trouble",
        d = { "<cmd>Trouble workspace_diagnostics<cr>", "Diagnostics" },
        q = { "<cmd>Trouble quickfix<cr>", "Quickfix" },
        n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Jump to next diagnostic" },
        p = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Jump to next diagnostic" },
        e = {
          "<cmd>lua require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })<cr>",
          "Jump to next error",
        },
        E = {
          "<cmd>lua require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })<cr>",
          "Jump to previous error",
        },
      },
    },
    ["<F5>"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
    ["<F6>"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
    ["<F7>"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" },
    ["<F8>"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  }, { mode = "n" })
end

return M
