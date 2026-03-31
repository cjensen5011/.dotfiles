-- Custom lualine bubbles theme using Catppuccin Mocha palette
-- Preserves the exact look from the previous (murdr) config

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    local colors = {
      thm_bg = "#1e1e2e",
      thm_fg = "#cdd6f4",
      thm_cyan = "#89dceb",
      thm_black = "#181825",
      thm_gray = "#313244",
      thm_magenta = "#cba6f7",
      thm_pink = "#f5c2e7",
      thm_red = "#f38ba8",
      thm_green = "#a6e3a1",
      thm_yellow = "#f9e2af",
      thm_blue = "#89b4fa",
      thm_orange = "#fab387",
      thm_black4 = "#585b70",
      thm_white = "#cdd6f4",
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.thm_black, bg = colors.thm_magenta },
        b = { fg = colors.thm_white, bg = colors.thm_gray },
        c = { fg = colors.thm_white },
      },
      insert = { a = { fg = colors.thm_black, bg = colors.thm_blue } },
      visual = { a = { fg = colors.thm_black, bg = colors.thm_cyan } },
      replace = { a = { fg = colors.thm_black, bg = colors.thm_red } },
      command = { a = { fg = colors.thm_black, bg = colors.thm_orange } },
      inactive = {
        a = { fg = colors.thm_white, bg = colors.thm_black },
        b = { fg = colors.thm_white, bg = colors.thm_black },
        c = { fg = colors.thm_white },
      },
    }

    opts.options = opts.options or {}
    opts.sections = opts.sections or {}
    opts.inactive_sections = opts.inactive_sections or {}

    opts.options.theme = bubbles_theme
    opts.options.component_separators = ""
    opts.options.section_separators = { left = "", right = "" }

    opts.sections.lualine_a = {
      { "mode", separator = { left = "" }, right_padding = 2 },
    }
    opts.sections.lualine_b = { "filename", "branch", "diff", "diagnostics" }
    opts.sections.lualine_c = { "=%" }
    opts.sections.lualine_x = {}
    opts.sections.lualine_y = { "encoding", "fileformat", "filetype", "progress" }
    opts.sections.lualine_z = {
      { "location", separator = { right = "" }, left_padding = 2 },
    }

    opts.inactive_sections.lualine_a = { "filename" }
    opts.inactive_sections.lualine_b = {}
    opts.inactive_sections.lualine_c = {}
    opts.inactive_sections.lualine_x = {}
    opts.inactive_sections.lualine_y = {}
    opts.inactive_sections.lualine_z = { "location" }

    opts.tabline = {}
    opts.extensions = {}

    return opts
  end,
}
