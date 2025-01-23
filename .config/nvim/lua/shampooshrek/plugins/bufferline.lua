return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local mocha = require("catppuccin.palettes").get_palette("mocha")
      require("bufferline").setup({
        options = {
          separator_style = "slope",
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = ""
            for e, n in pairs(diagnostics_dict) do
              local sym = e == "error" and " " or (e == "warning" and " " or " ")
              s = " " .. sym
            end
            return s
          end,
        },
        highlights = require("catppuccin.groups.integrations.bufferline").get({
          styles = { "italic", "bold" },
          custom = {
            all = {
              fill = { bg = "#000000" },
            },
            mocha = {
              background = { fg = mocha.text },
            },
            latte = {
              background = { fg = "#000000" },
            },
          },
        }),
      })
    end,
  },
  {
    "famiu/bufdelete.nvim",
    config = function() end,
  },
}
