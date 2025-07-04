return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = { "SessionLoadPost", "BufReadPre", "BufNewFile" },
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = ""
            for e, n in pairs(diagnostics_dict) do
              local sym = e == "error" and " " or (e == "warning" and " " or " ")
              s = " " .. sym
            end
            return s
          end,
          indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'underline'
          },
        },
        highlights = {
          fill = {
            fg = "",
            bg = "",
          },
          background = {
            fg = '#FFFFFF',
            bg = "",
          },
          tab = {
            fg = '#FFFFFF',
            bg = "",
          },
          tab_selected = {
            fg = '#FFFFFF',
            bg = "",
          },
          tab_separator = {
            fg = '#FFFFFF',
            bg = "",
          },
          tab_separator_selected = {
            fg = '#FF0000',
            bg = "#000000",
            sp = "#FF0000",
            underline = true,
          },
          tab_close = {
            fg = '#FFFFFF',
            bg = "",
          },
          close_button = {
            fg = '#FFFFFF',
            bg = "",
          },
          close_button_visible = {
            fg = '#FFFFFF',
            bg = "",
          },
          close_button_selected = {
            fg = '#FFFFFF',
            bg = "",
          },
          buffer_visible = {
            fg = '#FFFFFF',
            bg = "",
          },
          buffer_selected = {
            fg = '#FFFFFF',
            bg = "",
            bold = true,
            italic = true,
          },
          numbers = {
            fg = '#FFFFFF',
            bg = "",
          },
          numbers_visible = {
            fg = '#FFFFFF',
            bg = "",
          },
          numbers_selected = {
            fg = '#FFFFFF',
            bg = "",
            bold = false,
            italic = false,
          },
          diagnostic = {
            fg = '#FFFFFF',
            bg = "",
          },
          diagnostic_visible = {
            fg = '#FFFFFF',
            bg = "",
          },
          diagnostic_selected = {
            fg = '#FFFFFF',
            bg = "",
            bold = false,
            italic = false,
          },
          hint = {
            fg = '#FFFFFF',
            sp = '',
            bg = "",
          },
          hint_visible = {
            fg = '#FFFFFF',
            bg = "",
          },
          hint_selected = {
            fg = '#FFFFFF',
            bg = "",
            sp = '',
            bold = false,
            italic = false,
          },
          hint_diagnostic = {
            fg = '#FFFFFF',
            sp = '',
            bg = "",
          },
          hint_diagnostic_visible = {
            fg = '#FFFFFF',
            bg = "",
          },
          hint_diagnostic_selected = {
            fg = '#FFFFFF',
            bg = "",
            sp = '',
            bold = false,
            italic = false,
          },
          info = {
            fg = '#FFFFFF',
            sp = '',
            bg = "",
          },
          info_visible = {
            fg = '#FFFFFF',
            bg = "",
          },
          info_selected = {
            fg = '#FFFFFF',
            bg = "",
            sp = '',
            bold = false,
            italic = false,
          },
          info_diagnostic = {
            fg = '#FFFFFF',
            sp = '',
            bg = "",
          },
          info_diagnostic_visible = {
            fg = '#FFFFFF',
            bg = "",
          },
          info_diagnostic_selected = {
            fg = '#FFFFFF',
            bg = "",
            sp = '',
            bold = false,
            italic = false,
          },
          warning = {
            fg = '#FFFFFF',
            sp = '',
            bg = "",
          },
          warning_visible = {
            fg = '#FFFFFF',
            bg = "",
          },
          warning_selected = {
            fg = '#FFFFFF',
            bg = "",
            sp = '',
            bold = false,
            italic = false,
          },
          warning_diagnostic = {
            fg = '#FFFFFF',
            sp = '',
            bg = "",
          },
          warning_diagnostic_visible = {
            fg = '#FFFFFF',
            bg = "",
          },
          warning_diagnostic_selected = {
            fg = '#FFFFFF',
            bg = "",
            sp = '',
            bold = false,
            italic = false,
          },
          error = {
            fg = '#FFFFFF',
            bg = "",
            sp = '',
          },
          error_visible = {
            fg = '#FFFFFF',
            bg = "",
          },
          error_selected = {
            fg = '#FFFFFF',
            bg = "",
            sp = '',
            bold = false,
            italic = false,
          },
          error_diagnostic = {
            fg = '#FFFFFF',
            bg = "",
            sp = '',
          },
          error_diagnostic_visible = {
            fg = '#FFFFFF',
            bg = "",
          },
          error_diagnostic_selected = {
            fg = '#FFFFFF',
            bg = "",
            sp = '',
            italic = false,
            bold = false,
          },
          modified = {
            fg = '#FFFFFF',
            bg = "",
          },
          modified_visible = {
            fg = '#FFFFFF',
            bg = "",
          },
          modified_selected = {
            fg = '#FFFFFF',
            bg = "",
          },
          duplicate_selected = {
            fg = '#FFFFFF',
            bg = "",
            italic = false,
          },
          duplicate_visible = {
            fg = '#FFFFFF',
            bg = "",
            italic = false,
          },
          duplicate = {
            fg = '#FFFFFF',
            bg = "",
            italic = false,
          },
          separator_selected = {
            fg = '#232637',
            bg = "",
          },
          separator_visible = {
            fg = '#232637',
            bg = "",
          },
          separator = {
            fg = '#232637',
            bg = "",
          },
          indicator_visible = {
            fg = '#232637',
            bg = "",
          },
          indicator_selected = {
            fg = '#232637',
            bg = "",
          },
          pick_selected = {
            fg = '#232637',
            bg = "",
            italic = false,
            bold = false,
          },
          pick_visible = {
            fg = '#232637',
            bg = "",
            bold = false,
            italic = false,
          },
          pick = {
            fg = '#232637',
            bg = "",
            bold = false,
            italic = false,
          },
          offset_separator = {
            fg = '#232637',
            bg = "",
          },
          trunc_marker = {
            fg = '#232637',
            bg = "",
          }
        }
      }
      )
    end,
  },
  {
    "famiu/bufdelete.nvim",
    config = function() end,
  },
}
