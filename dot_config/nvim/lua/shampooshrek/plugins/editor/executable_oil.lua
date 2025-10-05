return {
  "stevearc/oil.nvim",
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
      padding = 2,
      max_width = 0.6,
      max_height = 0.6,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
      get_win_title = nil,
      preview_split = "auto",
      override = function(conf)
        return conf
      end,
    },
  },
}
