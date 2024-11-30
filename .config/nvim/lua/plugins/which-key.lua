return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    spec = {
      ["<leader>c"] = {},

      -- nvim jdts, nvim java
      ["<leader>j"] = { name = "java" },
      ["<leader>jt"] = { name = "test" },
      ["<leader>ja"] = { name = "accessors" },
    },
  },
}
