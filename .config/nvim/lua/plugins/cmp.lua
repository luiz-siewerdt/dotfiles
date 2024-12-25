return {
  {
    "saghen/blink.cmp",
    enabled = false,
    optional = true,
    opts = {
      keymap = {
        preset = "default",
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },

        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<CR>"] = { "accept", "fallback" },

        ["<C-space>"] = {
          function(cmp)
            cmp.show({ providers = { "snippets" } })
          end,
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    enabled = true,
    opts = function(_, opts)
      local cmp = require("cmp")
      local optMapping = opts.mapping
      optMapping["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })
      optMapping["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
      opts.window = {
        completion = {
          winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder",
          border = "single",
        },
        documentation = {
          winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,Pmenu:CmpBorder",
          border = "single",
          side_padding = 100,
        },
      }

      vim.api.nvim_set_hl(0, "CmpNormal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "CmpBorder", { bg = "NONE", fg = "#7dcfff" })

      opts.mapping = optMapping
    end,
  },
}
