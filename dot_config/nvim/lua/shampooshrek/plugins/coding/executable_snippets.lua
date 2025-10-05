return {
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    event = "InsertEnter",
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },
  {
    "rafamadriz/friendly-snippets",
    lazy = true,
    event = "InsertEnter",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
      require("vim-react-snippets").lazy_load()
    end,
  },
}
