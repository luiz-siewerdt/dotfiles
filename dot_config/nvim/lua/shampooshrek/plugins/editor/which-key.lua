return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  lazy = true,
  --@type wk.Spec
  opts = {
    preset = "helix",
    spec = {
      { "<leader><tab>", name = "+tabs" },
      { "<leader>c", name = "+code", icon = " " },
      { "<leader>d", name = "+debug" },
      { "<leader>f", name = "+file/find" },
      { "<leader>u", name = "+ui" },
      { "<leader>b", name = "+buffer" },
      { "<leader>r", name = "+rest/kulala", icon = "󰒊 " },
      { "<leader>l", name = "+Lazy" },
      { "<leader>q", name = "Close Tab", icon = "󰈆 " },
      { "<leader>Q", name = "Close All", icon = "󰈆 " },
      { "<leader>e", name = "Explorer", icon = "  " },
    }
  },
}
