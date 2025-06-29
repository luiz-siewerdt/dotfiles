return {
  "stevearc/oil.nvim",
  lazy = false,
  ---@module 'oil'
  ---@type oil.SetupOpts
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  opts = {
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    columns = { "icon" },
    keymaps = {
      ["<C-s>"] = false,
      ["<C-h>"] = false,
      ["<M-h>"] = "actions.select_split",
      ["<C-v>"] = { "actions.select", opts = { vertical = true } },
    },
    view_options = {
      show_hidden = true,
    },
    float = {
      -- Padding around the floating window
      padding = 2,
      -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      max_width = 0.6,
      max_height = 0.6,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
      -- optionally override the oil buffers window title with custom function: fun(winid: integer): string
      get_win_title = nil,
      -- preview_split: Split direction: "auto", "left", "right", "above", "below".
      preview_split = "auto",
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      override = function(conf)
        return conf
      end,
    },
  },
}
