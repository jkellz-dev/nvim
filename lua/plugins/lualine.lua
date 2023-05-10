local lualine = {}
local gitblame = require('gitblame')

function lualine.setup()
  local config = {
    options = {
      icons_enabled = true,
      theme = "catppuccin",
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = { "packer", "NvimTree", "neo-tree" },
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      -- lualine_c = { "filename" },
      lualine_c = {
        { gitblame.get_current_blame_text, cond = gitblame.is_blame_text_available }
      },

      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "filename" },
      lualine_z = { "progress", "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { "fzf", "fugitive", "nvim-dap-ui", "neo-tree" },
  }

  -- Inserts a component in lualine_c at left section
  local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
  end

  -- Inserts a component in lualine_x ot right section
  -- local function ins_right(component)
  --   table.insert(config.sections.lualine_x, component)
  -- end

  local cmake = require("cmake-tools")
  local icons = require("codicons")

  ins_left({
    function()
      local c_preset = cmake.get_configure_preset()
      return "CMake: [" .. (c_preset and c_preset or "X") .. "]"
    end,
    icon = icons.get("search"),
    cond = function()
      return cmake.is_cmake_project() and cmake.has_cmake_preset()
    end,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == "l" then
          vim.cmd("CMakeSelectBuildType")
        end
      end
    end,
  })

  ins_left({
    function()
      local type = cmake.get_build_type()
      return "CMake: [" .. (type and type or "") .. "]"
    end,
    icon = icons.get("search"),
    cond = function()
      return cmake.is_cmake_project() and not cmake.has_cmake_preset()
    end,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == "l" then
          vim.cmd("CMakeSelectBuildType")
        end
      end
    end,
  })

  ins_left({
    function()
      local kit = cmake.get_kit()
      return "[" .. (kit and kit or "X") .. "]"
    end,
    icon = icons.get("pencil"),
    cond = function()
      return cmake.is_cmake_project() and not cmake.has_cmake_preset()
    end,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == "l" then
          vim.cmd("CMakeSelectKit")
        end
      end
    end,
  })

  ins_left({
    function()
      return "Build"
    end,
    icon = icons.get("gear"),
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == "l" then
          vim.cmd("CMakeBuild")
        end
      end
    end,
  })

  ins_left({
    function()
      local c_preset = cmake.get_configure_preset()
      return "[" .. (c_preset and c_preset or "X") .. "]"
    end,
    icon = icons.get("search"),
    cond = function()
      return cmake.is_cmake_project() and cmake.has_cmake_preset()
    end,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == "l" then
          vim.cmd("CMakeSelectBuildType")
        end
      end
    end,
  })

  ins_left({
    function()
      local b_target = cmake.get_build_target()
      return "[" .. (b_target and b_target or "X") .. "]"
    end,
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == "l" then
          vim.cmd("CMakeSelectBuildTarget")
        end
      end
    end,
  })

  ins_left({
    function()
      return icons.get("debug")
    end,
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == "l" then
          vim.cmd("CMakeDebug")
        end
      end
    end,
  })

  ins_left({
    function()
      return icons.get("run")
    end,
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == "l" then
          vim.cmd("CMakeRun")
        end
      end
    end,
  })

  ins_left({
    function()
      local l_target = cmake.get_launch_target()
      return "[" .. (l_target and l_target or "X") .. "]"
    end,
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == "l" then
          vim.cmd("CMakeSelectLaunchTarget")
        end
      end
    end,
  })

  require("lualine").setup(config)
end

return lualine
