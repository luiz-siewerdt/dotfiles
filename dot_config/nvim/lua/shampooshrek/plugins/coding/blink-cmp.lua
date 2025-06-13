return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  -- optional: provides snippets for the snippet source
  dependencies = { "rafamadriz/friendly-snippets", "mlaursen/vim-react-snippets" },

  -- use a release tag to download pre-built binaries
  version = "*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = {
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-y>"] = { "select_and_accept" },
      -- ["<CR>"] = { "select_and_accept" },

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

    -- signature = {
    --   enabled = true,
    --   menu = {
    --     border = "rounded",
    --     winhighlight =
    --     "Normal:BlinkCmpDocBorder,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
    --   },
    --   -- window = {}
    -- },

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
              -- (optional) use highlights from mini.icons
              -- highlight = function(ctx)
              --   local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              --   return hl
              -- end,
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
              --   local hl = ctx.kind_hl
              --   if vim.tbl_contains({ "Path" }, ctx.source_name) then
              --     local _, hl, _ = require("mini.icons").get("file", ctx.label)
              --     if hl then
              --       hl = hl
              --     end
              --   end
              --   return hl
              -- end,
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
          -- preselect = false,
          auto_insert = true,
        },
      },
    },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    snippets = { preset = "luasnip" },
  },
  opts_extend = { "sources.default" },
}
