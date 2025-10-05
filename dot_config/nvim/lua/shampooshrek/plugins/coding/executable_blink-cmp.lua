return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = { "rafamadriz/friendly-snippets", "mlaursen/vim-react-snippets" },

  version = "*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-y>"] = { "select_and_accept" },

      ["<C-e>"] = { "hide" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
      ["<C-n>"] = { "show", "select_next", "fallback_to_mappings" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },

      ["<Tab>"] = {},
      ["<S-Tab>"] = {},

      ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
    },

    completion = {
      ghost_text = {
        enabled = true,
        show_with_menu = true,
      },
      menu = {
        border = "rounded",
        winhighlight =
        "Normal:BlinkCmpDocBorder,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
        draw = {
          treesitter = { "lsp" },
          components = {
            kind_icon = {
              text = function(ctx)
                local icon, _, _ = require("mini.icons").get('lsp', ctx.kind)
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, _, _ = require("mini.icons").get("file", ctx.label)
                  if dev_icon then
                    icon = dev_icon
                  end
                end
                return icon .. ctx.icon_gap
              end,
              highlight = function(ctx)
                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local _, hl2, _ = require("mini.icons").get("file", ctx.label)
                  if hl2 then
                    hl = hl2
                  end
                end
                return hl
              end,
            },
            kind = {
              highlight = function(ctx)
                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local _, hl2, _ = require("mini.icons").get("file", ctx.label)
                  if hl2 then
                    hl = hl2
                  end
                end
                return hl
              end,
            }
          }
        },
      },
      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
          winhighlight =
          "Normal:BlinkCmpDocBorder,FloatBorder:FloatBorder",
        },
      },
      list = {
        selection = {
          auto_insert = true,
        },
      },
    },

    appearance = {
      nerd_font_variant = "mono",
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    snippets = { preset = "luasnip" },
  },
  opts_extend = { "sources.default" },
}
